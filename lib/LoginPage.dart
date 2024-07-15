//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:project/DashboardPage.dart';
// import 'package:provider/provider.dart';
// import 'ForgetPasswordPage.dart';
// import 'SignupPage.dart';
// import 'UserState.dart';
//
// class LoginPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     void signInWithEmailAndPassword() async {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text,
//         );
//         String userId = userCredential.user!.uid;
//
//         // Update userId using UserState
//         Provider.of<UserState>(context, listen: false).setUserId(userId);
//
//
//         // If login is successful, navigate to the VerifyMobile page
//         showToast('login successfully');
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => DashboardPage()),
//         );
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//           // Show login failed message
//           showToast('Invalid email or password');
//         } else {
//           // Show other error messages
//           showToast('An error occurred');
//         }
//       }catch (e) {
//         showToast('Login failed');
//       }
//     }
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
//                   ],
//                 ),
//                 Column(
//                   children: <Widget>[
//                     TextField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         hintText: "Email",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: const Icon(Icons.email),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: passwordController,
//                       decoration: InputDecoration(
//                         hintText: "Password",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: Colors.green.withOpacity(0.1),
//                         filled: true,
//                         prefixIcon: const Icon(Icons.password),
//                       ),
//                       obscureText: true,
//                     ),
//                   ],
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(top: 3, left: 3),
//                   child: ElevatedButton(
//                     onPressed: signInWithEmailAndPassword,
//                     child: const Text(
//                       "Log In",
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
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         const Text("Don't have an account?"),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => SignUpPage()),
//                             );
//                           },
//                           child: const Text(
//                             "Sign Up",
//                             style: TextStyle(color: Colors.orange),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
//                         );
//                       },
//                       child: const Text(
//                         "Forgot Password",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         shape: const StadiumBorder(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'ForgetPasswordPage.dart';
// import 'SignupPage.dart';
// import 'UserState.dart';
//
// class LoginPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
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
//     void signInWithEmailAndPassword() async {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text,
//         );
//         String userId = userCredential.user!.uid;
//
//         // Update userId using UserState
//         Provider.of<UserState>(context, listen: false).setUserId(userId);
//
//         // If login is successful, navigate to the DashboardPage
//         showToast('Login successful');
//         Navigator.pushReplacementNamed(context, '/dashboard');
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//           showToast('Invalid email or password');
//         } else {
//           showToast('An error occurred');
//         }
//       } catch (e) {
//         showToast('Login failed');
//       }
//     }
//
//     return Scaffold(
//       backgroundColor: Color(0xFFDAF0CB),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 15, right: 15, top: 120),
//             child: Card(
//               color: Color(0xFFD9F1C4),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               elevation: 8,
//               child: Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image.asset('assets/images/Logo.png', height: 80),
//                     Text(
//                       'Welcome Back',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Log in to your account',
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.green.shade900,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     _buildTextField('Email', emailController),
//                     SizedBox(height: 5),
//                     _buildTextField('Password', passwordController, obscureText: true),
//                     SizedBox(height: 20),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: signInWithEmailAndPassword,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50),
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Text(
//                             'Log in',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.green.shade900,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'or log in with',
//                       style: TextStyle(
//                         color: Color(0xFF82C341),
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset('assets/images/google.png', height: 30),
//                         SizedBox(width: 10),
//                         Image.asset('assets/images/insta.png', height: 30),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/forgot_password');
//                       },
//                       child: Text(
//                         'Forgot Password?',
//                         style: TextStyle(
//                           color: Colors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Don't have an account?",
//                           style: TextStyle(
//                             color: Color(0xFF82C341),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, '/signup');
//                           },
//                           child: Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               color: Colors.green.shade900,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
//     return Container(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               color: Color(0xFF82C341),
//               fontSize: 12,
//             ),
//           ),
//           SizedBox(height: 2),
//           TextField(
//             controller: controller,
//             obscureText: obscureText,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.transparent,
//               contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(50),
//                 borderSide: BorderSide(color: Colors.white),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(50),
//                 borderSide: BorderSide(color: Colors.green.shade700),
//               ),
//             ),
//             style: TextStyle(color: Colors.black),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/DashboardPage.dart';
import 'package:provider/provider.dart';
import 'ForgetPasswordPage.dart';
import 'SignupPage.dart';
import 'UserState.dart';
import 'VerifyMobile.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    void signInWithEmailAndPassword() async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        String userId = userCredential.user!.uid;

        // Update userId using UserState
        Provider.of<UserState>(context, listen: false).setUserId(userId);

        // If login is successful, navigate to the VerifyMobile page
        showToast('Login successfully');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          // Show login failed message
          showToast('Invalid email or password');
        } else {
          // Show other error messages
          showToast('An error occurred');
        }
      } catch (e) {
        showToast('Login failed');
      }
    }

    Future<void> signInWithGoogle() async {
      try {
        print('called');
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
                    SizedBox(height: 50),
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/Logo.png'),
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Log in to your account",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  children: <Widget>[
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
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: signInWithEmailAndPassword,
                  child: const Text(
                    "Log in",
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
                  "or Log in with",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: signInWithGoogle,
                  icon: Image.asset('assets/images/google.png', height: 30),
                  label: Text("Google", style: TextStyle(color: Colors.black, fontSize:16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPasswordPage()),
                    );
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.red , fontSize:18),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have an account?",
                      style: TextStyle(fontSize:18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.green,fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}



