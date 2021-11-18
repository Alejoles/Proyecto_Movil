import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/dashboard_controller.dart';
import 'package:prueba_proyecto/ui/pages/adopta_page.dart';
import 'package:prueba_proyecto/ui/pages/donar_page.dart';
import 'package:prueba_proyecto/ui/pages/home_page.dart';
import 'package:prueba_proyecto/ui/pages/poner_adopcion_page.dart';
import 'package:prueba_proyecto/ui/pages/profile_page.dart';
import 'package:prueba_proyecto/ui/widgets/nav_bar.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({Key? key}) : super(key: key);

  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
          body: Container(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                AdoptaPage(),
                PonerAdopcionPage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: CustomAnimatedBottomBar(
              containerHeight: 70,
              backgroundColor: Colors.white,
              selectedIndex: controller.tabIndex,
              showElevation: true,
              itemCornerRadius: 25,
              curve: Curves.easeInOut,
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                    icon: const Icon(Icons.home),
                    title: const Text("Home"),
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey),
                BottomNavyBarItem(
                    icon: const Icon(Icons.catching_pokemon),
                    title: const Text("Adoptar"),
                    activeColor: Colors.purple,
                    inactiveColor: Colors.grey),
                BottomNavyBarItem(
                  icon: const Icon(Icons.pets),
                  title: const Text("Adopción"),
                  activeColor: Colors.brown,
                  inactiveColor: Colors.grey,
                ),
                BottomNavyBarItem(
                    icon: const Icon(Icons.person),
                    title: const Text("Perfil"),
                    activeColor: Colors.deepOrange,
                    inactiveColor: Colors.grey),
              ],
              onItemSelected: controller.changeTabIndex));
    });
  }
}
