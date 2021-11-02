import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationController extends GetxController {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  final FirebaseAuth _fbAuth;

  AuthenticationController(this._fbAuth);

  Stream<User?> get authStateChanges => _fbAuth.authStateChanges();

  void testFirebase() {
    DatabaseReference _testRef =
        FirebaseDatabase.instance.reference().child("test");
    _testRef.set("Hello world firebase");
  }

  Future<void> signOut() async {
    await _fbAuth.signOut();
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _fbAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _fbAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
