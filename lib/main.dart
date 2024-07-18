import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/AboutUsScreen.dart';
import 'package:project/BankAccountPage.dart';
import 'package:project/BankDetailsPage.dart';
import 'package:project/ContactUsPage.dart';
import 'package:project/DashboardPage.dart';
import 'package:project/LoginPage.dart';
import 'package:project/MyEarningsPage.dart';
import 'package:project/ProfilePage.dart';
import 'package:project/SplashScreen.dart';
import 'package:project/VerifyMobile.dart';
import 'package:project/WithdrawAmountPage.dart';
import 'package:project/components/CashbackPage.dart';
import 'SignupPage.dart';
import 'UserState.dart';
import 'components/FeaturedStores.dart';
import 'components/PrivacyPolicyPage.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SplashScreen(),
    );
  }
}


