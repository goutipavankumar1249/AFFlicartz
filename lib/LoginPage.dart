
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
        if (e.code == 'user-not-found') {
          showToast('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          showToast('Wrong password provided for that user.');
        } else {
          showToast('Error: ${e.message}');
        }
      } catch (e) {
        showToast('Login failed: ${e.toString()}');
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

          // Update userId using UserState
          Provider.of<UserState>(context, listen: false).setUserId(userId);
          User? user = userCredential.user;

          if (user != null) {
            DatabaseReference usersRef = FirebaseDatabase.instance.ref().child('users');
            Query userQuery = usersRef.orderByChild('uid').equalTo(userId);
            DataSnapshot snapshot = await userQuery.get();

            if (snapshot.exists) {
              // User exists, fetch existing user data
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
        Fluttertoast.showToast(msg: "Google Sign-in failed: ${e.toString()}");
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



