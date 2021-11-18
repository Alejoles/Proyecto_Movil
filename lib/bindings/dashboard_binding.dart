import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/authentication_controller.dart';
import 'package:prueba_proyecto/controllers/dashboard_controller.dart';
import 'package:prueba_proyecto/controllers/home_controller.dart';
import 'package:prueba_proyecto/controllers/poner_adopcion_controller.dart';
import 'package:prueba_proyecto/services/db_service.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AuthenticationController>(
        () => AuthenticationController(FirebaseAuth.instance),
        fenix: true);
    Get.lazyPut<PonerAdopcionController>(() => PonerAdopcionController());
    Get.lazyPut<DatabaseService>(() => DatabaseService());
  }
}
