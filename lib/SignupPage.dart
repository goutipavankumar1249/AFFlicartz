
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:project/DashboardPage.dart';
// import 'package:provider/provider.dart';
// import 'LoginPage.dart';
// import 'UserState.dart';
// import 'VerifyMobile.dart';
//
// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//   bool isPasswordVisible = false;
//   bool isConfirmPasswordVisible = false;
//   bool agreedToTerms = false;
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   void handleSignUp() async {
//     if (usernameController.text.isEmpty ||
//         emailController.text.isEmpty ||
//         passwordController.text.isEmpty ||
//         confirmPasswordController.text.isEmpty) {
//       Fluttertoast.showToast(msg: "All Fields are required");
//       return;
//     }
//
//     if (passwordController.text != confirmPasswordController.text) {
//       Fluttertoast.showToast(msg: "Passwords do not match");
//       return;
//     }
//
//     if (!agreedToTerms) {
//       Fluttertoast.showToast(msg: "You must agree to the terms and conditions");
//       return;
//     }
//
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//
//       User? user = userCredential.user;
//       String userId = userCredential.user!.uid;
//       print(userId);
//
//       // Update userId using UserState
//       Provider.of<UserState>(context, listen: false).setUserId(userId);
//
//       if (user != null) {
//         DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').push();
//         await userRef.set({
//           'userName': usernameController.text.trim(),
//           'email': user.email,
//           'uid': user.uid,
//           'role': 'user',
//           'earnedAmount': '0',
//           'sub_id1': (10000 + (90000 * ((DateTime.now().millisecondsSinceEpoch % 100000) / 100000))).toInt().toString(),
//
//         });
//
//         Fluttertoast.showToast(msg: "Signup Successfully");
//
//         // Clear form
//         usernameController.clear();
//         emailController.clear();
//         passwordController.clear();
//         confirmPasswordController.clear();
//         setState(() {
//           agreedToTerms = false;
//         });
//
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyMobile()));
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error signing up");
//     }
//   }
//
//   Future<void> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//
//       if (googleUser != null) {
//         final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//
//         final UserCredential userCredential = await _auth.signInWithCredential(credential);
//         String userId = userCredential.user!.uid;
//         print('it is the userId: ${userId}');
//         // Update userId using UserState
//         Provider.of<UserState>(context, listen: false).setUserId(userId);
//         User? user = userCredential.user;
//         print('it is the user : ${user}');
//
//         if (user != null) {
//           // Check if user data already exists in the database
//           DatabaseReference usersRef = FirebaseDatabase.instance.ref().child('users');
//           print(usersRef);
//           Query userQuery = usersRef.orderByChild('uid').equalTo(userId);
//           DataSnapshot snapshot = await userQuery.get();
//           print('User snapshot: ${snapshot.value}');
//           if (snapshot.exists) {
//             // User exists, fetch existing user data
//
//             print('i am entered');
//             // Map<String, dynamic> existingUserData = (snapshot.value as Map).values.first;
//             // Provider.of<UserState>(context, listen: false).setUserData(existingUserData);
//
//             Fluttertoast.showToast(msg: "Login Successfully");
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
//           } else {
//             // User does not exist, store new user data
//             Map<String, dynamic> newUserdata = {
//               'userName': user.displayName ?? 'No Username',
//               'email': user.email ?? 'No Email',
//               'uid': user.uid,
//               'role': 'user',
//               'earnedAmount': '0',
//               'sub_id1': (10000 + (90000 * ((DateTime.now().millisecondsSinceEpoch % 100000) / 100000))).toInt().toString(),
//             };
//
//             DatabaseReference newUserRef = usersRef.push();
//             await newUserRef.set(newUserdata);
//             Provider.of<UserState>(context, listen: false).setUserData(newUserdata);
//
//             Fluttertoast.showToast(msg: "Signup Successfully");
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyMobile()));
//           }
//         } else {
//           Fluttertoast.showToast(msg: "Google Sign-in failed");
//         }
//       } else {
//         Fluttertoast.showToast(msg: "Google Sign-in canceled");
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Google Sign-in failed");
//     }
//   }
//
//   @override
//   void dispose() {
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             color: Color(0xFFCBF4C9), // Light green background color
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       SizedBox(height:30),
//                       Container(
//                         height: 100,
//                         width: 100,
//                         child: Image.asset('assets/images/Logo.png'),
//                       ),
//                       SizedBox(height:1),
//                       Text(
//                         "Create Your Account",
//                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         "Join us and earn cashback on your favorite stores!",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height:10),
//                   Column(
//                     children: <Widget>[
//                       TextField(
//                         controller: usernameController,
//                         decoration: InputDecoration(
//                           hintText: "UserName",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18),
//                             borderSide: BorderSide.none,
//                           ),
//                           fillColor: Colors.white,
//                           filled: true,
//                           prefixIcon: const Icon(Icons.person),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       TextField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           hintText: "Email",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18),
//                             borderSide: BorderSide.none,
//                           ),
//                           fillColor: Colors.white,
//                           filled: true,
//                           prefixIcon: const Icon(Icons.email),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       TextField(
//                         controller: passwordController,
//                         decoration: InputDecoration(
//                           hintText: "Password",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18),
//                             borderSide: BorderSide.none,
//                           ),
//                           fillColor: Colors.white,
//                           filled: true,
//                           prefixIcon: const Icon(Icons.lock),
//                         ),
//                         obscureText: true,
//                       ),
//                       const SizedBox(height: 20),
//                       TextField(
//                         controller: confirmPasswordController,
//                         decoration: InputDecoration(
//                           hintText: "Confirm Password",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18),
//                             borderSide: BorderSide.none,
//                           ),
//                           fillColor: Colors.white,
//                           filled: true,
//                           prefixIcon: const Icon(Icons.lock),
//                         ),
//                         obscureText: true,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: agreedToTerms,
//                         onChanged: (bool? value) {
//                           setState(() {
//                             agreedToTerms = value ?? false;
//                           });
//                         },
//                         activeColor: Color(0xFF82C341),
//                       ),
//                       Expanded(
//                         child: Text(
//                           'I agree to the Terms and Privacy Policy',
//                           style: TextStyle(
//                             color: Colors.green.shade900,
//                             fontSize: 13,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height:10),
//                   ElevatedButton(
//                     onPressed: handleSignUp,
//                     child: const Text(
//                       "Create Account",
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       shape: StadiumBorder(),
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       backgroundColor: Colors.green,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     "or sign up with",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton.icon(
//                     onPressed: signInWithGoogle,
//                     icon: Image.asset('assets/images/google.png', height: 30),
//                     label: Text("Google", style: TextStyle(color: Colors.black, fontSize:16)),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.black,
//                       shape: StadiumBorder(),
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                       side: BorderSide(color: Colors.black),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       const Text("Already have an account?"),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (context) => LoginPage()),
//                           );
//                         },
//                         child: Text(
//                           'Log in',
//                           style: TextStyle(
//                             color: Colors.green.shade900,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/DashboardPage.dart';
import 'package:provider/provider.dart';
import 'LoginPage.dart';
import 'UserState.dart';
import 'VerifyMobile.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool agreedToTerms = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void handleSignUp() async {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "All Fields are required");
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Fluttertoast.showToast(msg: "Passwords do not match");
      return;
    }

    if (!agreedToTerms) {
      Fluttertoast.showToast(msg: "You must agree to the terms and conditions");
      return;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = userCredential.user;
      String userId = userCredential.user!.uid;
      print(userId);

      // Update userId using UserState
      Provider.of<UserState>(context, listen: false).setUserId(userId);

      if (user != null) {
        DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').push();
        await userRef.set({
          'userName': usernameController.text.trim(),
          'email': user.email,
          'uid': user.uid,
          'role': 'user',
          'earnedAmount': '0',
          'sub_id1': (10000 + (90000 * ((DateTime.now().millisecondsSinceEpoch % 100000) / 100000))).toInt().toString(),
        });

        Fluttertoast.showToast(msg: "Signup Successfully");

        // Clear form
        usernameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        setState(() {
          agreedToTerms = false;
        });

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyMobile()));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error signing up");
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        String userId = userCredential.user!.uid;
        print('it is the userId: ${userId}');
        // Update userId using UserState
        Provider.of<UserState>(context, listen: false).setUserId(userId);
        User? user = userCredential.user;
        print('it is the user : ${user}');

        if (user != null) {
          // Check if user data already exists in the database
          DatabaseReference usersRef = FirebaseDatabase.instance.ref().child('users');
          print(usersRef);
          Query userQuery = usersRef.orderByChild('uid').equalTo(userId);
          DataSnapshot snapshot = await userQuery.get();
          print('User snapshot: ${snapshot.value}');
          if (snapshot.exists) {
            // User exists, fetch existing user data

            print('i am entered');
            // Map<String, dynamic> existingUserData = (snapshot.value as Map).values.first;
            // Provider.of<UserState>(context, listen: false).setUserData(existingUserData);

            Fluttertoast.showToast(msg: "Login Successfully");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
          } else {
            // User does not exist, store new user data
            Map<String, dynamic> newUserdata = {
              'userName': user.displayName ?? 'No Username',
              'email': user.email ?? 'No Email',
              'uid': user.uid,
              'role': 'user',
              'earnedAmount': '0',
              'sub_id1': (10000 + (90000 * ((DateTime.now().millisecondsSinceEpoch % 100000) / 100000))).toInt().toString(),
            };

            DatabaseReference newUserRef = usersRef.push();
            await newUserRef.set(newUserdata);
            Provider.of<UserState>(context, listen: false).setUserData(newUserdata);

            Fluttertoast.showToast(msg: "Signup Successfully");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyMobile()));
          }
        } else {
          Fluttertoast.showToast(msg: "Google Sign-in failed");
        }
      } else {
        Fluttertoast.showToast(msg: "Google Sign-in canceled");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Google Sign-in failed");
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
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
                      SizedBox(height: 30),
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/Logo.png'),
                      ),
                      SizedBox(height: 1),
                      Text(
                        "Create Your Account",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Join us and earn cashback on your favorite stores!",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: <Widget>[
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: "UserName",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: agreedToTerms,
                        onChanged: (bool? value) {
                          setState(() {
                            agreedToTerms = value ?? false;
                          });
                        },
                        activeColor: Color(0xFF82C341),
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the Terms and Privacy Policy',
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: handleSignUp,
                    child: const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.green,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "or sign up with",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: signInWithGoogle,
                    icon: Image.asset('assets/images/google.png', height: 30),
                    label: Text("Google", style: TextStyle(color: Colors.black, fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already have an account?",
                        style : TextStyle(fontSize: 16)
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}










