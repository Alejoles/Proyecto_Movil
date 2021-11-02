import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationController extends GetxController {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  void testFirebase() {
    DatabaseReference _testRef =
        FirebaseDatabase.instance.reference().child("test");
    _testRef.set("Hello world firebase");
  }
}
