import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/authentication_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(() => AuthenticationController());
  }
}
