import 'package:authentification/firebase_options.dart';
import 'package:authentification/screens/home_screen.dart';
import 'package:authentification/screens/login_email_password_screen.dart';
import 'package:authentification/screens/login_screen.dart';
import 'package:authentification/screens/phone_screen.dart';
import 'package:authentification/screens/signup_email_password_screen.dart';
import 'package:authentification/services/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAutMethode>(
          create: (_) => FirebaseAutMethode(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<FirebaseAutMethode>().authState,
            initialData: null)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Auth Demo',
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          EmailPasswordSignup.routeName: (context) =>
              const EmailPasswordSignup(),
          EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
          PhoneScreen.routeName: (context) => const PhoneScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const HomeScreen();
    }
    return const LoginScreen();
  }
}
