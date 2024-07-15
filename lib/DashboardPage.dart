// import 'package:flutter/material.dart';
// import 'BankDetailsPage.dart';
// import 'ContactUsPage.dart';
// import 'HomePage.dart';
// import 'MyEarningsPage.dart';
// import 'ProfilePage.dart';
// import 'AboutUsScreen.dart';
// import 'components/FeaturedStores.dart';
//
// class DashboardPage extends StatefulWidget {
//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage> {
//   int _bottomNavIndex = 0; // Default to the Home page
//   int _sideDrawerIndex = 0; // Default to the Home page
//
//   final List<Widget> _bottomNavPages = [
//     HomePage(),
//     MyEarningsPage(),
//     ProfilePage(),
//     FeaturedStores(),
//   ];
//
//   final List<Widget> _sideDrawerPages = [
//     HomePage(),
//     MyEarningsPage(),
//     ProfilePage(),
//     BankDetailsPage(),
//     AboutUsScreen(),
//     ContactUsPage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFCBF4C9), // Set background color
//       appBar: AppBar(
//         backgroundColor: Color(0xFFCBF4C9),
//         elevation: 0.1,
//         shadowColor: Colors.black.withOpacity(0.9),
//         title: Row(
//           children: [
//             Text(
//               'Afflicartz',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Spacer(),
//             Icon(Icons.notifications_active_outlined, color: Colors.black),
//             SizedBox(width: 10),
//           ],
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color(0xFFCBF4C9),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: AssetImage('assets/images/Logo.png'), // Replace with actual image
//                   ),
//                 ],
//               ),
//             ),
//             _buildDrawerItem(
//               icon: Icons.home,
//               text: 'Home',
//               index: 0,
//               onTap: () => _navigateToSideDrawerPage(0),
//             ),
//             _buildDrawerItem(
//               icon: Icons.attach_money_rounded,
//               text: 'Earnings',
//               index: 1,
//               onTap: () => _navigateToSideDrawerPage(1),
//             ),
//             _buildDrawerItem(
//               icon: Icons.person,
//               text: 'Profile',
//               index: 2,
//               onTap: () => _navigateToSideDrawerPage(2),
//             ),
//             _buildDrawerItem(
//               icon: Icons.account_balance,
//               text: 'Bank Details',
//               index: 3,
//               onTap: () => _navigateToSideDrawerPage(3),
//             ),
//             _buildDrawerItem(
//               icon: Icons.info_outline,
//               text: 'About Us',
//               index: 4,
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AboutUsScreen()),
//               ),
//             ),
//             _buildDrawerItem(
//               icon: Icons.contact_page_outlined,
//               text: 'Contact Us',
//               index: 5,
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ContactUsPage()),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: _buildBody(),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Color(0xFFCBF4C9),
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Earnings'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//           BottomNavigationBarItem(icon: Icon(Icons.store), label: 'All Stores'),
//         ],
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black,
//         unselectedLabelStyle: TextStyle(color: Colors.black),
//         currentIndex: _bottomNavIndex,
//         onTap: (index) {
//           _navigateToBottomNavBarPage(index);
//         },
//         type: BottomNavigationBarType.fixed, // Ensure labels are always shown
//       ),
//     );
//   }
//
//
//   Widget _buildBody() {
//     // Display corresponding page for bottom navigation or drawer selection
//     if (_sideDrawerIndex == 3) {
//       return BankDetailsPage(); // Ensure BankDetailsPage is displayed for sideDrawerIndex 3
//     } else if (_bottomNavIndex >= 0 && _bottomNavIndex < _bottomNavPages.length) {
//       return _bottomNavPages[_bottomNavIndex];
//     } else {
//       return Center(
//         child: Text('Invalid Page Index $_bottomNavIndex'),
//       );
//     }
//   }
//
//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String text,
//     required int index,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(icon),
//       title: Text(text),
//       onTap: onTap,
//       selected: _sideDrawerIndex == index,
//       selectedTileColor: Color.fromARGB(223, 218, 215, 215),
//       selectedColor: Colors.black,
//     );
//   }
//
//   void _navigateToBottomNavBarPage(int index) {
//     setState(() {
//       if (index >= 0 && index < _bottomNavPages.length) {
//         _bottomNavIndex = index;
//         _sideDrawerIndex = index;
//       }
//     });
//   }
//
//   void _navigateToSideDrawerPage(int index) {
//     setState(() {
//       if (index >= 0 && index < _sideDrawerPages.length) {
//         _sideDrawerIndex = index;
//         if (index < _bottomNavPages.length) {
//           _bottomNavIndex = index;
//         }
//       }
//     });
//     Navigator.of(context).pop(); // Close the drawer
//   }
// }

import 'package:flutter/material.dart';
import 'BankDetailsPage.dart';
import 'ContactUsPage.dart';
import 'HomePage.dart';
import 'MyEarningsPage.dart';
import 'ProfilePage.dart';
import 'AboutUsScreen.dart';
import 'components/FeaturedStores.dart';
import 'components/PrivacyPolicyPage.dart';
import 'components/TermsConditionsPage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _bottomNavIndex = 0; // Default to the Home page
  int _sideDrawerIndex = 0; // Default to the Home page

  final List<Widget> _bottomNavPages = [
    HomePage(),
    MyEarningsPage(),
    ProfilePage(),
    FeaturedStores(),
  ];

  final List<Widget> _sideDrawerPages = [
    HomePage(),
    MyEarningsPage(),
    ProfilePage(),
    BankDetailsPage(),
    AboutUsScreen(),
    ContactUsPage(),
    PrivacyPolicyPage(),
    TermsConditionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCBF4C9), // Set background color
      appBar: AppBar(
        backgroundColor: Color(0xFFCBF4C9),
        elevation: 0.1,
        shadowColor: Colors.black.withOpacity(0.9),
        title: Row(
          children: [
            Text(
              'Afflicartz',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(Icons.notifications_active_outlined, color: Colors.black),
            SizedBox(width: 10),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Remove padding from ListView
          children: <Widget>[
            Container(
              height: 120, // Adjust this height to make the DrawerHeader smaller or larger
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFCBF4C9),
                ),
                margin: EdgeInsets.zero, // Remove margin
                padding: EdgeInsets.zero, // Remove padding
                child: Center(
                  child: Text(
                    'Afflicartz',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.home,
              text: 'Home',
              index: 0,
              onTap: () => _navigateToSideDrawerPage(0),
            ),
            _buildDrawerItem(
              icon: Icons.attach_money_rounded,
              text: 'Earnings',
              index: 1,
              onTap: () => _navigateToSideDrawerPage(1),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              text: 'Profile',
              index: 2,
              onTap: () => _navigateToSideDrawerPage(2),
            ),
            _buildDrawerItem(
              icon: Icons.account_balance,
              text: 'Bank Details',
              index: 3,
              onTap: () => _navigateToSideDrawerPage(3),
            ),
            _buildDrawerItem(
              icon: Icons.info_outline,
              text: 'About Us',
              index: 4,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.contact_page_outlined,
              text: 'Contact Us',
              index: 5,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUsPage()),
              ),
            ),

            _buildDrawerItem(
              icon: Icons.privacy_tip,
              text: 'Privacy Policy',
              index: 6,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
              ),
            ),

            _buildDrawerItem(
              icon: Icons.description,
              text: 'Terms & Conditions',
              index: 7,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsConditionsPage()),
              ),
            ),
          ],
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFCBF4C9),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Earnings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'All Stores'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          _navigateToBottomNavBarPage(index);
        },
        type: BottomNavigationBarType.fixed, // Ensure labels are always shown
      ),
    );
  }

  Widget _buildBody() {
    // Display corresponding page for bottom navigation or drawer selection
    if (_sideDrawerIndex == 3) {
      return BankDetailsPage(); // Ensure BankDetailsPage is displayed for sideDrawerIndex 3
    } else if (_bottomNavIndex >= 0 && _bottomNavIndex < _bottomNavPages.length) {
      return _bottomNavPages[_bottomNavIndex];
    } else {
      return Center(
        child: Text('Invalid Page Index $_bottomNavIndex'),
      );
    }
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required int index,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
      selected: _sideDrawerIndex == index,
      selectedTileColor: Color.fromARGB(223, 218, 215, 215),
      selectedColor: Colors.black,
    );
  }

  void _navigateToBottomNavBarPage(int index) {
    setState(() {
      if (index >= 0 && index < _bottomNavPages.length) {
        _bottomNavIndex = index;
        _sideDrawerIndex = index;
      }
    });
  }

  void _navigateToSideDrawerPage(int index) {
    setState(() {
      if (index >= 0 && index < _sideDrawerPages.length) {
        _sideDrawerIndex = index;
        if (index < _bottomNavPages.length) {
          _bottomNavIndex = index;
        }
      }
    });
    Navigator.of(context).pop(); // Close the drawer
  }
}


