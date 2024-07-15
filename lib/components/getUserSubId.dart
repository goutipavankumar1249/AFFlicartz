import 'package:firebase_database/firebase_database.dart';

Future<String?> getUserSubId(String userId) async {
  try {
    print('Fetching user data for userId: $userId');
    DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
    DatabaseEvent event = await database.orderByChild('uid').equalTo(userId).once();

    if (event.snapshot.exists) {
      Map<dynamic, dynamic> userData = event.snapshot.value as Map<dynamic, dynamic>;
      String userKey = userData.keys.first;
      print('inside the function ${userKey}');
      return userData[userKey]['sub_id1'];
    } else {
      print('User not found');
      return null;
    }
  } catch (error) {
    print('Error fetching user data: $error');
    return null;
  }
}
