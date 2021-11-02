import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/dashboard_controller.dart';
import 'package:prueba_proyecto/ui/pages/adopta_page.dart';
import 'package:prueba_proyecto/ui/pages/donar_page.dart';
import 'package:prueba_proyecto/ui/pages/home_page.dart';
import 'package:prueba_proyecto/ui/pages/poner_adopcion_page.dart';

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
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              AdoptaPage(),
              PonerAdopcionPage(),
              HomePage(),
              DonarPage(),
              PonerAdopcionPage() //TODO: Página de perfil de usuario.
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          index: controller.tabIndex,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.amber, //TODO: Buscar buen color.
          items: const <Widget>[
            Icon(Icons.catching_pokemon),
            Icon(Icons.pets_sharp),
            Icon(Icons.home),
            Icon(Icons.card_giftcard),
            Icon(Icons.person)
          ],
          onTap: controller.changeTabIndex,
        ),
      );
    });
  }
}
