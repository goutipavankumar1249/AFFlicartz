// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:provider/provider.dart';
// import 'UserState.dart';
// import 'WithdrawAmountPage.dart';
// import 'BankAccountPage.dart';
//
// class MyEarningsPage extends StatefulWidget {
//   @override
//   _MyEarningsPageState createState() => _MyEarningsPageState();
// }
//
// class _MyEarningsPageState extends State<MyEarningsPage> {
//   late DatabaseReference _userRef;
//   num _earnings = 0.0;
//   num _walletAmount = 0.0; // Default wallet amount
//
//   @override
//   void initState() {
//     super.initState();
//     String userId = Provider.of<UserState>(context).userId;
//     _userRef = FirebaseDatabase.instance.ref().child('users').child(userId);
//     _fetchUserData();
//   }
//
//   void _fetchUserData() async {
//     try {
//       DatabaseEvent event = await _userRef.once();
//       DataSnapshot snapshot = event.snapshot;
//
//       Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;
//
//       if (userData != null) {
//         setState(() {
//           _earnings = userData['earnedAmount'] ?? 0.0;
//         });
//       } else {
//         print('User data not found');
//       }
//     } catch (error) {
//       print('Error fetching user data: $error');
//     }
//   }
//
//   void _handleWithdrawClick() async {
//     try {
//       print('it is called');
//       String userId = Provider.of<UserState>(context, listen: false).userId;
//       print(userId);
//       _userRef = FirebaseDatabase.instance.ref().child('users').child(userId);
//       DatabaseEvent event = await _userRef.once();
//       DataSnapshot snapshot = event.snapshot;
//       Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;
//
//       if (userData != null && userData['accountNumber'] != null && userData['ifscCode'] != null) {
//         print("Account Number: ${userData['accountNumber']}");
//         print("IFSC Code: ${userData['ifscCode']}");
//         print("Both accountNumber and ifscCode are present.");
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => WithdrawAmountPage()),
//         );
//       } else {
//         print("Either accountNumber or ifscCode is missing, or the unique identifier does not exist in the database.");
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => BankAccountPage()),
//         );
//       }
//     } catch (error) {
//       print('Error checking account info: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Total Earnings',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     '₹$_earnings',
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Earnings will show here within 72 hours of your shopping via Afflicartz.',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   _buildOptionCard(
//                     'My Order Details',
//                     Icons.receipt_long,
//                     Colors.blue,
//                         () {
//                       // Navigate to My Order Details page
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   _buildOptionCard(
//                     'Withdraw',
//                     Icons.payment,
//                     Colors.purple,
//                     _handleWithdrawClick,
//                   ),
//                   SizedBox(height: 20),
//                   _buildWalletCard(), // New wallet card
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOptionCard(String title, IconData icon, Color color, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         elevation: 4,
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [color.withOpacity(0.7), color],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             children: <Widget>[
//               Icon(icon, size: 40, color: Colors.white),
//               SizedBox(width: 16),
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Widget _buildWalletCard() {
//   return Card(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//     ),
//     elevation: 4,
//     child: Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Wallet',
//             style: TextStyle(
//               fontSize:20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'amount will be withdrawable after receiving the product',
//             style: TextStyle(
//               fontSize: 16,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 10),
//           Text(
//             '₹$_walletAmount',
//             style: TextStyle(
//               fontSize: 24,
//               color: Colors.green,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// class _walletAmount {
// }
//



// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:provider/provider.dart';
// import 'UserState.dart';
// import 'WithdrawAmountPage.dart';
// import 'BankAccountPage.dart';
//
// class MyEarningsPage extends StatefulWidget {
//   @override
//   _MyEarningsPageState createState() => _MyEarningsPageState();
// }
//
// class _MyEarningsPageState extends State<MyEarningsPage> {
//   late DatabaseReference _userRef;
//   num _earnings = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _userRef = FirebaseDatabase.instance.ref().child('users');
//     _fetchUserData();
//   }
//
//   void _fetchUserData() async {
//     try {
//       //String userId = Provider.of<UserState>(context, listen: false).userId;
//       String userId = 'Svp23MPBzGdGOwKrdxcFEfGCsfl1';
//       Query userQuery = _userRef.orderByChild('uid').equalTo(userId);
//       DataSnapshot snapshot = await userQuery.get();
//       Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;
//       if (userData != null) {
//         String uniqueKey = userData.keys.first;
//         setState(() {
//           _earnings = num.parse(userData[uniqueKey]['earnedAmount'] ?? '0');
//         });
//       } else {
//         print('User data not found');
//       }
//     } catch (error) {
//       print('Error fetching user data: $error');
//     }
//   }
//
//   void _handleWithdrawClick() async {
//     try {
//       print('it is called');
//       // String userId = Provider.of<UserState>(context, listen: false).userId;
//       // print(userId);
//       String userId = 'Svp23MPBzGdGOwKrdxcFEfGCsfl1';
//       _userRef = FirebaseDatabase.instance.ref().child('users').child(userId);
//       DatabaseEvent event = await _userRef.once();
//       DataSnapshot snapshot = event.snapshot;
//       Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;
//
//       if (userData != null && userData['accountNumber'] != null && userData['ifscCode'] != null) {
//         print("Account Number: ${userData['accountNumber']}");
//         print("IFSC Code: ${userData['ifscCode']}");
//         print("Both accountNumber and ifscCode are present.");
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => WithdrawAmountPage()),
//         );
//       } else {
//         print("Either accountNumber or ifscCode is missing, or the unique identifier does not exist in the database.");
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => BankAccountPage()),
//         );
//       }
//     } catch (error) {
//       print('Error checking account info: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Total Earnings',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     '₹$_earnings',
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Earnings will show here within 72 hours of your shopping via Afflicartz.',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   _buildOptionCard(
//                     'My Order Details',
//                     Icons.receipt_long,
//                     Colors.blue,
//                         () {
//                       // Navigate to My Order Details page
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   _buildOptionCard(
//                     'Withdraw',
//                     Icons.payment,
//                     Colors.purple,
//                     _handleWithdrawClick,
//                   ),
//                   SizedBox(height: 20),
//                   _buildWalletCard(), // New wallet card
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOptionCard(String title, IconData icon, Color color, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         elevation: 4,
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [color.withOpacity(0.7), color],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             children: <Widget>[
//               Icon(icon, size: 40, color: Colors.white),
//               SizedBox(width: 16),
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Widget _buildWalletCard() {
//   return Card(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//     ),
//     elevation: 4,
//     child: Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Wallet',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Amount will be withdrawable after receiving the product',
//             style: TextStyle(
//               fontSize: 16,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 10),
//           Text(
//             '₹0.00', // Placeholder as requested
//             style: TextStyle(
//               fontSize: 24,
//               color: Colors.green,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }



// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:provider/provider.dart';
// import 'UserState.dart';
// import 'WithdrawAmountPage.dart';
// import 'BankAccountPage.dart';
// import 'components/CashbackPage.dart';
// import 'components/getWalletAmount.dart';
//
// class MyEarningsPage extends StatefulWidget {
//   @override
//   _MyEarningsPageState createState() => _MyEarningsPageState();
// }
//
// class _MyEarningsPageState extends State<MyEarningsPage> {
//   late DatabaseReference _userRef;
//   num _earnings = 0.0;
//   num _walletAmount = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _userRef = FirebaseDatabase.instance.ref().child('users');
//     _fetchUserData();
//   }
//
//   void _fetchUserData() async {
//     try {
//       // Replace with actual userId
//       String userId = 'Svp23MPBzGdGOwKrdxcFEfGCsfl1';
//       Query userQuery = _userRef.orderByChild('uid').equalTo(userId);
//       DataSnapshot snapshot = await userQuery.get();
//       Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;
//       if (userData != null) {
//         String uniqueKey = userData.keys.first;
//         setState(() {
//           _earnings = num.parse(userData[uniqueKey]['earnedAmount'] ?? '0');
//         });
//
//         // Fetch wallet amount and update state
//         String subId1 = userData[uniqueKey]['sub_id1'];
//         num walletAmount = await getWalletAmount(subId1);
//         setState(() {
//           _walletAmount = walletAmount;
//         });
//       } else {
//         print('User data not found');
//       }
//     } catch (error) {
//       print('Error fetching user data: $error');
//     }
//   }
//
//   void _handleWithdrawClick() async {
//     try {
//       // Replace with actual userId
//       String userId = 'Svp23MPBzGdGOwKrdxcFEfGCsfl1';
//       _userRef = FirebaseDatabase.instance.ref().child('users').child(userId);
//       DatabaseEvent event = await _userRef.once();
//       DataSnapshot snapshot = event.snapshot;
//       Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;
//
//       if (userData != null && userData['accountNumber'] != null && userData['ifscCode'] != null) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => WithdrawAmountPage()),
//         );
//       } else {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => BankAccountPage()),
//         );
//       }
//     } catch (error) {
//       print('Error checking account info: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   IconButton(
//                     icon: Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.green.shade900,
//                     ),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                   //const SizedBox(height: 30.0),
//                   Text(
//                     'Total Earnings',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     '₹$_earnings',
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Earnings will show here within 72 hours of your shopping via Afflicartz.',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   _buildOptionCard(
//                     'My Order Details',
//                     Icons.receipt_long,
//                     Colors.blue,
//                     () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CashbackPage()),
//                       );
//                     },
//
//                   ),
//                   SizedBox(height: 20),
//                   _buildOptionCard(
//                     'Withdraw',
//                     Icons.payment,
//                     Colors.purple,
//                     _handleWithdrawClick,
//                   ),
//                   SizedBox(height: 20),
//                   _buildWalletCard(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOptionCard(String title, IconData icon, Color color, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         elevation: 4,
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [color.withOpacity(0.7), color],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             children: <Widget>[
//               Icon(icon, size: 40, color: Colors.white),
//               SizedBox(width: 16),
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildWalletCard() {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       elevation: 4,
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Wallet',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Amount will be withdrawable after receiving the product',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 10),
//             Text(
//               '₹$_walletAmount',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.green,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'UserState.dart';
import 'WithdrawAmountPage.dart';
import 'BankAccountPage.dart';
import 'components/CashbackPage.dart';
import 'components/getWalletAmount.dart';

class MyEarningsPage extends StatefulWidget {
  @override
  _MyEarningsPageState createState() => _MyEarningsPageState();
}

class _MyEarningsPageState extends State<MyEarningsPage> {
  late DatabaseReference _userRef;
  num _earnings = 0.0;
  num _walletAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _userRef = FirebaseDatabase.instance.ref().child('users');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchUserData();
  }

  void _fetchUserData() async {
    try {
      // Replace with actual userId
      String userId = Provider.of<UserState>(context, listen: false).userId;
      print('in the earnings page $userId');
      Query userQuery = _userRef.orderByChild('uid').equalTo(userId);
      DataSnapshot snapshot = await userQuery.get();
      Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;
      if (userData != null) {
        String uniqueKey = userData.keys.first;
        setState(() {
          _earnings = num.parse(userData[uniqueKey]['earnedAmount'] ?? '0');
        });

        // Fetch wallet amount and update state
        String subId1 = userData[uniqueKey]['sub_id1'];
        num walletAmount = await getWalletAmount(subId1);
        setState(() {
          _walletAmount = walletAmount;
        });
      } else {
        print('User data not found');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  void _handleWithdrawClick() async {
    try {
      // Replace with actual userId
      String userId = Provider.of<UserState>(context, listen: false).userId;
      print('inside the checck ${userId}');
      _userRef = FirebaseDatabase.instance.ref().child('users').child(userId);
      DatabaseEvent event = await _userRef.once();
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;

      if (userData != null && userData['bankAccount'] != null && userData['ifsc'] != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WithdrawAmountPage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BankAccountPage()),
        );
      }
    } catch (error) {
      print('Error checking account info: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green.shade900),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Total Earnings',
          style: TextStyle(
            color: Colors.green.shade900,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Withdrawable Amount:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '₹$_earnings',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Earnings will show here within 72 hours of your shopping via Afflicartz.',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 40, thickness: 2),
              _buildOptionCard(
                'My Order Details',
                Icons.receipt_long,
                Colors.blue,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CashbackPage()),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildOptionCard(
                'Withdraw',
                Icons.payment,
                Colors.purple,
                _handleWithdrawClick,
              ),
              SizedBox(height: 20),
              _buildWalletCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: <Widget>[
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWalletCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Wallet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Amount will be withdrawable after receiving the product',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '₹$_walletAmount',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}





