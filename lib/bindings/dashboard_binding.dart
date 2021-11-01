import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/authentication_controller.dart';
import 'package:prueba_proyecto/controllers/dashboard_controller.dart';
import 'package:prueba_proyecto/controllers/home_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AuthenticationController>(() => AuthenticationController());
  }
}
