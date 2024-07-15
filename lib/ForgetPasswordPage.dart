import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void resetPassword() async {
      if (emailController.text.trim().isEmpty) {
        showToast('Please enter your email');
        return;
      }

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
        showToast('Password reset email sent');
      } on FirebaseAuthException catch (e) {
        showToast('Error: ' + e.message!);
      } catch (e) {
        showToast('Error sending password reset email');
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.green.shade900),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Colors.green.shade900,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFFCBF4C9), // Light green background color
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/images/Logo.png'),
                        ),
                        Text(
                          'Forgot Password',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Enter your email to reset your password',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: resetPassword,
                      child: Text('Send Reset Link', style: TextStyle(fontSize: 18, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ],
                ),
              ),
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
