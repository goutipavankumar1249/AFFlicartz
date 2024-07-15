// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   bool isLoading = true;
//   Map<String, dynamic>? userProfileData;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUserProfileData();
//   }
//
//   Future<void> fetchUserProfileData() async {
//     String userId = 'x6A6ltjNYROaMQQP97vebVVkbWI2'; // Replace with the actual user ID
//     DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
//     Query userQuery = database.orderByChild('uid').equalTo(userId);
//     DataSnapshot snapshot = await userQuery.get();
//
//     if (snapshot.exists) {
//       Map<dynamic, dynamic> userData = snapshot.value as Map<dynamic, dynamic>;
//       String userKey = userData.keys.first;
//       setState(() {
//         userProfileData = Map<String, dynamic>.from(userData[userKey]);
//         isLoading = false;
//       });
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.green.shade900),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Profile',
//           style: GoogleFonts.poppins(
//             color: Colors.green,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.green),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : userProfileData == null
//           ? Center(child: Text('No user data found'))
//           : SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage(
//                     'assets/images/defaultProfileIcon.png', // Replace with actual user image URL if available
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: Text(
//                   userProfileData!['userName'] ?? 'No Name',
//                   style: GoogleFonts.poppins(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ProfileDetailCard(
//                 title: 'Email',
//                 detail: userProfileData!['email'] ?? 'No Email',
//                 icon: Icons.email,
//               ),
//               ProfileDetailCard(
//                 title: 'Role',
//                 detail: userProfileData!['role'] ?? 'No Role',
//                 icon: Icons.person,
//               ),
//               ProfileDetailCard(
//                 title: 'Earned Amount',
//                 detail: '₹${userProfileData!['earnedAmount'] ?? '0'}',
//                 icon: Icons.monetization_on,
//               ),
//               ProfileDetailCard(
//                 title: 'Sub ID',
//                 detail: userProfileData!['sub_id1'] ?? 'No Sub ID',
//                 icon: Icons.confirmation_number,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ProfileDetailCard extends StatelessWidget {
//   final String title;
//   final String detail;
//   final IconData icon;
//
//   ProfileDetailCard({
//     required this.title,
//     required this.detail,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Icon(icon, color: Colors.green),
//             SizedBox(width: 16),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[700],
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   detail,
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                     color: Colors.grey[800],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'LoginPage.dart';
import 'MyEarningsPage.dart';
import 'UserState.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = true;
  Map<String, dynamic>? userProfileData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchUserProfileData();
  }

  Future<void> fetchUserProfileData() async {
    String userId = Provider.of<UserState>(context, listen: false).userId;
    DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
    Query userQuery = database.orderByChild('uid').equalTo(userId);
    DataSnapshot snapshot = await userQuery.get();

    if (snapshot.exists) {
      Map<dynamic, dynamic> userData = snapshot.value as Map<dynamic, dynamic>;
      String userKey = userData.keys.first;
      setState(() {
        userProfileData = Map<String, dynamic>.from(userData[userKey]);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green.shade900),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : userProfileData == null
          ? Center(child: Text('No user data found'))
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/defaultProfileIcon.png', // Replace with actual user image URL if available
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Hi, ${userProfileData!['userName'] ?? 'No Name'}!',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ProfileDetailCard(
                title: 'Email',
                detail: userProfileData!['email'] ?? 'No Email',
                icon: Icons.email,
              ),
              ProfileDetailCard(
                title: 'Role',
                detail: userProfileData!['role'] ?? 'No Role',
                icon: Icons.person,
              ),
              ProfileDetailCard(
                title: 'Earned Amount',
                detail: '₹${userProfileData!['earnedAmount'] ?? '0'}',
                icon: Icons.monetization_on,
              ),
              ProfileDetailCard(
                title: 'Sub ID',
                detail: userProfileData!['sub_id1'] ?? 'No Sub ID',
                icon: Icons.confirmation_number,
              ),
              ListTile(
                leading: Icon(Icons.monetization_on, color: Colors.green),
                title: Text(
                  'My Earnings',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyEarningsPage(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailCard extends StatelessWidget {
  final String title;
  final String detail;
  final IconData icon;

  ProfileDetailCard({
    required this.title,
    required this.detail,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.green),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    //fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  detail,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



