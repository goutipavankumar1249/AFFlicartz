// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:project/DashboardPage.dart';
// import 'package:provider/provider.dart';
// import 'UserState.dart';
//
// class VerifyMobile extends StatelessWidget {
//   final TextEditingController _mobileController = TextEditingController();
//   String? selectedState;
//   String? selectedCollege;
//
//   VerifyMobile({Key? key}) : super(key: key);
//
//   Future<void> _submitForm(BuildContext context, String userId) async {
//     final mobile = _mobileController.text;
//     final state = selectedState;
//     final college = selectedCollege;
//
//     if (mobile.isNotEmpty && state != null && college != null) {
//       try {
//         // Store user data in Firebase Realtime Database using the userId
//         DatabaseReference database =
//         FirebaseDatabase.instance.ref().child('users').child(userId); // Reference to user's data
//         await database.update({
//           'mobile': mobile,
//           'state': state,
//           'college': college,
//         });
//         showToast('Data stored Successful');
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => DashboardPage()),
//         );
//       } catch (e) {
//         // Show error message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to update data: $e'),
//           ),
//         );
//       }
//     } else {
//       // Show error message if any field is empty
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill all the fields'),
//         ),
//       );
//     }
//   }
//   void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Access userId from the UserState using Provider
//     String userId = Provider.of<UserState>(context).userId;
//
//     List<String> colleges = [
//       "RGUKT BASAR",
//       "RGUKT NUZVID",
//       "RGUKT ONGOLE",
//       "RGUKT RK VALLEY",
//     ];
//
//     List<String> states = [
//       "Telangana",
//       "Andhra Pradesh",
//     ];
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             height: MediaQuery.of(context).size.height - 50,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     const SizedBox(height: 9.0),
//                     Container(
//                       height: 150,
//                       width: 150,
//                       child: Image.asset('assets/images/Logo.png'),
//                     ),
//                     TextField(
//                       controller: _mobileController,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         hintText: "Mobile No",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: const Icon(Icons.mobile_friendly),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     DropdownButtonFormField<String>(
//                       value: selectedState,
//                       onChanged: (value) {
//                         selectedState = value;
//                       },
//                       items: states.map((item) {
//                         return DropdownMenuItem(
//                           value: item,
//                           child: Text(item),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(
//                         hintText: "Select State",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: const Icon(Icons.location_on),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     DropdownButtonFormField<String>(
//                       value: selectedCollege,
//                       onChanged: (value) {
//                         selectedCollege = value;
//                       },
//                       items: colleges.map((item) {
//                         return DropdownMenuItem(
//                           value: item,
//                           child: Text(item),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(
//                         hintText: "Select College",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: const Icon(Icons.school),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(top: 3, left: 3),
//                   child: ElevatedButton(
//                     onPressed: () => _submitForm(context, userId),
//                     child: const Text(
//                       "Submit",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       shape: const StadiumBorder(),
//                       padding: const EdgeInsets.symmetric(vertical: 1),
//                       backgroundColor: Colors.green,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'UserState.dart';
// import 'DashboardPage.dart';
//
// class VerifyMobile extends StatelessWidget {
//   final TextEditingController _mobileController = TextEditingController();
//   String? selectedState;
//   String? selectedCollege;
//
//   VerifyMobile({Key? key}) : super(key: key);
//
//   Future<void> _submitForm(BuildContext context, String userId) async {
//     final mobile = _mobileController.text;
//     final state = selectedState;
//     final college = selectedCollege;
//
//     if (mobile.isNotEmpty && state != null && college != null) {
//       try {
//         // Store user data in Firebase Realtime Database using the userId
//         DatabaseReference database =
//         FirebaseDatabase.instance.ref().child('users').child(userId); // Reference to user's data
//         await database.update({
//           'mobile': mobile,
//           'state': state,
//           'college': college,
//         });
//         showToast('Data stored successfully');
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => DashboardPage()),
//         );
//       } catch (e) {
//         // Show error message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Failed to update data: $e'),
//           ),
//         );
//       }
//     } else {
//       // Show error message if any field is empty
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill all the fields'),
//         ),
//       );
//     }
//   }
//
//   void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Access userId from the UserState using Provider
//     String userId = Provider.of<UserState>(context).userId;
//
//     List<String> colleges = [
//       "RGUKT BASAR",
//       "RGUKT NUZVID",
//       "RGUKT ONGOLE",
//       "RGUKT RK VALLEY",
//     ];
//
//     List<String> states = [
//       "Telangana",
//       "Andhra Pradesh",
//     ];
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             color: Color(0xFFCBF4C9), // Light green background color
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     const SizedBox(height: 50),
//                     Container(
//                       height: 100,
//                       width: 100,
//                       child: Image.asset('assets/images/Logo.png'),
//                     ),
//                     Text(
//                       "afflicartz special form",
//                       style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: _mobileController,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         hintText: "Mobile No",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.white,
//                         filled: true,
//                         prefixIcon: const Icon(Icons.mobile_friendly),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     DropdownButtonFormField<String>(
//                       value: selectedState,
//                       onChanged: (value) {
//                         selectedState = value;
//                       },
//                       items: states.map((item) {
//                         return DropdownMenuItem(
//                           value: item,
//                           child: Text(item),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(
//                         hintText: "Select State",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.white,
//                         filled: true,
//                         prefixIcon: const Icon(Icons.location_on),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     DropdownButtonFormField<String>(
//                       value: selectedCollege,
//                       onChanged: (value) {
//                         selectedCollege = value;
//                       },
//                       items: colleges.map((item) {
//                         return DropdownMenuItem(
//                           value: item,
//                           child: Text(item),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(
//                         hintText: "Select College",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.white,
//                         filled: true,
//                         prefixIcon: const Icon(Icons.school),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(top: 3, left: 3),
//                   child: ElevatedButton(
//                     onPressed: () => _submitForm(context, userId),
//                     child: const Text(
//                       "Submit",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       shape: const StadiumBorder(),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       backgroundColor: Colors.green,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'UserState.dart';
import 'DashboardPage.dart';

class VerifyMobile extends StatelessWidget {
  final TextEditingController _mobileController = TextEditingController(text: '+91');
  final TextEditingController _userNameController = TextEditingController();
  String? selectedState;
  String? selectedCollege;

  VerifyMobile({Key? key}) : super(key: key);

  Future<void> _submitForm(BuildContext context, String userId) async {
    final mobile = _mobileController.text;
    final state = selectedState;
    final college = selectedCollege;

    if (mobile.isNotEmpty && state != null && college != null) {
      try {
        // Query the database to find the unique key based on the uid
        DatabaseReference database = FirebaseDatabase.instance.ref().child('users');
        DatabaseEvent event = await database.orderByChild('uid').equalTo(userId).once();

        if (event.snapshot.exists) {
          Map<dynamic, dynamic> userData = event.snapshot.value as Map<dynamic, dynamic>;
          String uniqueKey = userData.keys.first;

          // Update the data at the location of the unique key
          DatabaseReference userRef = database.child(uniqueKey);
          await userRef.update({
            'mobile': mobile,
            'state': state,
            'college': college,
          });

          showToast('Data stored successfully');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          );
        } else {
          showToast('User not found');
        }
      } catch (e) {
        showToast('Failed to update data: $e');
      }
    } else {
      showToast('Please fill all the fields');
    }
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access userId and userEmail from the UserState using Provider
    String userId = Provider.of<UserState>(context).userId;
    print('The userId is $userId');
    List<String> colleges = [
      "RGUKT BASAR",
      "RGUKT NUZVID",
      "RGUKT ONGOLE",
      "RGUKT RK VALLEY",
    ];

    List<String> states = [
      "Telangana",
      "Andhra Pradesh",
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Color(0xFFCBF4C9), // Light green background color
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/Logo.png'),
                    ),
                    Text(
                      "Create Your Account",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _mobileController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Mobile No",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(Icons.mobile_friendly),
                      ),
                      onChanged: (text) {
                        if (!text.startsWith('+91')) {
                          _mobileController.text = '+91';
                          _mobileController.selection = TextSelection.fromPosition(
                            TextPosition(offset: _mobileController.text.length),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: selectedState,
                      onChanged: (value) {
                        selectedState = value;
                      },
                      items: states.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: "Select State",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(Icons.location_on),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: selectedCollege,
                      onChanged: (value) {
                        selectedCollege = value;
                      },
                      items: colleges.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: "Select College",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(Icons.school),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ElevatedButton(
                    onPressed: () => _submitForm(context, userId),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




