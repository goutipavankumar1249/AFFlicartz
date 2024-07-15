import 'package:firebase_database/firebase_database.dart';

Future<void> updateUserRewards(double cashbackAmount, String userId, String orderId) async {
  try {
    // Reference to the 'users' node in the Firebase database
    DatabaseReference usersRef = FirebaseDatabase.instance.ref().child('users');

    // Query to find the user by userId
    DatabaseEvent event = await usersRef.orderByChild('uid').equalTo(userId).once();

    // Check if the snapshot contains any data
    if (event.snapshot.exists) {
      // Extract user data from the snapshot
      Map<dynamic, dynamic> userData = event.snapshot.value as Map<dynamic, dynamic>;
      print('User data: $userData');

      // Fetch the first user key from the userData map
      String userKey = userData.keys.first;
      print('User key: $userKey');

      // Extract the current reward amount and convert it to a double
      double userReward = double.tryParse(userData[userKey]['earnedAmount'].toString()) ?? 0.0;
      print('Current user reward: $userReward');

      // Fetch the list of processed orders
      List<dynamic> processedOrders = userData[userKey]['processedOrders'] ?? [];
      print('Processed orders: $processedOrders');

      // Check if the order has already been processed
      if (!processedOrders.contains(orderId)) {
        // Calculate the new reward amount
        double newReward = userReward + cashbackAmount;
        print('New reward: $newReward');

        // Add the current order ID to the list of processed orders
        processedOrders.add(orderId);

        // Reference to the specific user's node in the database
        DatabaseReference userRef = usersRef.child(userKey);

        // Update the user's earnedAmount and processedOrders in the database
        await userRef.update({
          'earnedAmount': newReward.toString(),
          'processedOrders': processedOrders,
        });

        print('User rewards updated successfully');
      } else {
        print('Order already processed for rewards');
      }
    } else {
      print('User not found');
    }
  } catch (error) {
    print('Error fetching user data: $error');
  }
}
