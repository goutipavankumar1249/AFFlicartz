import 'package:cloud_firestore/cloud_firestore.dart';

Future<num> getWalletAmount(String subId1) async {
  try {
    // Debug print to check function call
    print('Fetching wallet amount for sub_id1: $subId1');

    // Fetch wallet amount from Firestore
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('transactions')
        .where('sub_id1', isEqualTo: subId1)
        .get();

    num walletAmount = 0;
    querySnapshot.docs.forEach((doc) {
      print('Found transaction: ${doc.data()}');  // Debug print for found transaction
      // Ensure 'user_commission' is converted to num type
      var userCommission = doc['user_commission'];
      if (userCommission is num) {
        walletAmount += userCommission;
      } else if (userCommission is String) {
        walletAmount += num.tryParse(userCommission) ?? 0;
      }
    });

    print('Wallet amount fetched successfully: $walletAmount');  // Debug print for final amount
    return walletAmount;
  } catch (error) {
    print('Error fetching wallet amount: $error');
    return 0;
  }
}
