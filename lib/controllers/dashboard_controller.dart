import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void changePage(int index) {}
}
