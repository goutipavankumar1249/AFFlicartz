import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'DashboardPage.dart';
import 'LoginPage.dart';
import 'UserState.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(
      const Duration(seconds: 2),
          () => checkAuthStatus(),
    );
  }

  void checkAuthStatus() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is signed in
      String userId = user.uid;
      print('this is want we want  ${userId}');
      Provider.of<UserState>(context, listen: false).setUserId(userId);
      print('user in the splash ${user}');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      // User is not signed in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
      body: SafeArea(
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/Affli.gif'), // Replace 'your_gif_file.gif' with your actual GIF file path
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
