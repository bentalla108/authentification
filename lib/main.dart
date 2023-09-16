import 'package:authentification/screens/login_email_password_screen.dart';
import 'package:authentification/screens/login_screen.dart';
import 'package:authentification/screens/phone_screen.dart';
import 'package:authentification/screens/signup_email_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        EmailPasswordSignup.routeName: (context) => const EmailPasswordSignup(),
        EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
        PhoneScreen.routeName: (context) => const PhoneScreen(),
      },
    );
  }
}
