import 'package:authentification/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAutMethode {
  final FirebaseAuth _auth;

  FirebaseAutMethode(this._auth);

  // STATE persistence provider
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  // Inscription par email :

  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (!context.mounted) return;
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      showSnackBar(context, e.message!);
    }
  }

  Future<void> lopWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        if (!context.mounted) return;
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      showSnackBar(context, e.message!);
    }
  }

  // Verification Email :

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }
}
