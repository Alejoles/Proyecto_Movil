import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  final FirebaseAuth _fbAuth;

  AuthenticationController(this._fbAuth);

  Stream<User?> get authStateChanges => _fbAuth.authStateChanges();

  User? get currentUser => _fbAuth.currentUser;

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _fbAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _fbAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return "Signed up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
