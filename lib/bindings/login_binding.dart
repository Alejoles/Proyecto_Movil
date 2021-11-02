import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/authentication_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(
        () => AuthenticationController(FirebaseAuth.instance));
  }
}
