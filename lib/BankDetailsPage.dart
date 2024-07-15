// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:project/BankAccountPage.dart';
// import 'package:provider/provider.dart';
// import 'UserState.dart';
//
// class BankDetailsPage extends StatefulWidget {
//   @override
//   _BankDetailsPageState createState() => _BankDetailsPageState();
// }
//
// class _BankDetailsPageState extends State<BankDetailsPage> {
//   Map<String, dynamic> userData = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }
//
//   Future<void> _fetchUserData() async {
//     try {
//       // Use a fixed userId for testing purposes
//       //String userId = 'KEzYaSh4o4PRwFNtIMIlWk84dHg1';
//       String userId = Provider.of<UserState>(context, listen: false).userId;
//       DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
//       Query userQuery = database.orderByChild('uid').equalTo(userId);
//       DataSnapshot snapshot = await userQuery.get();
//
//       if (snapshot.exists) {
//         Map<dynamic, dynamic> userData = snapshot.value as Map<dynamic, dynamic>;
//         String userKey = userData.keys.first;
//         setState(() {
//           this.userData = Map<String, dynamic>.from(userData[userKey]);
//         });
//       } else {
//         print('User not found');
//       }
//     } catch (error) {
//       print('Error fetching user data: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor: Colors.green.shade100,
//       appBar: AppBar(
//         title: Text('Bank Details'),
//       ),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(16),
//           margin: EdgeInsets.symmetric(horizontal: 16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Column(
//                   children: [
//                     Image.asset('assets/images/Logo.png', width: 64, height: 64),
//                     SizedBox(height: 8),
//                     Text(
//                       'Bank Details',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color : Colors.green,
//                       ),
//                     ),
//                     Text(
//                       'Here are your bank account details',
//                       style: TextStyle(fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16),
//               _buildDetailRow('Account Number', userData['bankAccount']),
//               _buildDetailRow('IFSC Code', userData['ifsc']),
//               _buildDetailRow('Account Holder Name', userData['name']),
//               _buildDetailRow('Phone', userData['phone']),
//               _buildDetailRow('beneId', userData['beneId']),
//               _buildDetailRow('email', userData['bankEmail']),
//               _buildDetailRow('address1', userData['address1']),
//               SizedBox(height: 16),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => BankAccountPage()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   ),
//                   child: Text('Edit Profile'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailRow(String label, String? value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.grey.shade700,
//             ),
//           ),
//           Text(
//             value ?? 'N/A', // Display 'N/A' if value is null
//             style: TextStyle(
//               color: Colors.grey.shade700,
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project/BankAccountPage.dart';
import 'package:provider/provider.dart';
import 'UserState.dart';

class BankDetailsPage extends StatefulWidget {
  @override
  _BankDetailsPageState createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      // Use a fixed userId for testing purposes
      //String userId = 'KEzYaSh4o4PRwFNtIMIlWk84dHg1';
      String userId = Provider.of<UserState>(context, listen: false).userId;
      DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
      Query userQuery = database.orderByChild('uid').equalTo(userId);
      DataSnapshot snapshot = await userQuery.get();

      if (snapshot.exists) {
        Map<dynamic, dynamic> userData = snapshot.value as Map<dynamic, dynamic>;
        String userKey = userData.keys.first;
        setState(() {
          this.userData = Map<String, dynamic>.from(userData[userKey]);
        });
      } else {
        print('User not found');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text('Bank Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/Logo.png', width: 64, height: 64),
                    SizedBox(height: 8),
                    Text(
                      'Bank Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color : Colors.green,
                      ),
                    ),
                    Text(
                      'Here are your bank account details',
                      style: TextStyle(fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _buildDetailRow('Account Number', userData['bankAccount']),
              _buildDetailRow('IFSC Code', userData['ifsc']),
              _buildDetailRow('Account Holder Name', userData['name']),
              _buildDetailRow('Phone', userData['phone']),
              _buildDetailRow('beneId', userData['beneId']),
              _buildDetailRow('email', userData['bankEmail']),
              _buildDetailRow('address1', userData['address1']),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BankAccountPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text('Edit Profile'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            value ?? 'N/A', // Display 'N/A' if value is null
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

