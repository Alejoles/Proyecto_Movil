import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/authentication_controller.dart';
import 'package:prueba_proyecto/controllers/dashboard_controller.dart';
import 'package:prueba_proyecto/controllers/home_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AuthenticationController>(
        () => AuthenticationController(FirebaseAuth.instance));
  }
}
