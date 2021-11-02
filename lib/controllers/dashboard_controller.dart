import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var tabIndex = 2;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
