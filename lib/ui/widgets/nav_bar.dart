import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/home_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 55,
      backgroundColor: Colors.blueAccent,
      items: const <Widget>[
        Icon(Icons.home),
        Icon(Icons.catching_pokemon),
        Icon(Icons.pets_sharp),
        Icon(Icons.card_giftcard)
      ],
      onTap: (index) {
        if (index == 0) {
          Get.toNamed("/home");
        } else if (index == 1) {
          Get.toNamed("/adopta");
        } else if (index == 2) {
          Get.toNamed("/adopcion");
        } else if (index == 3) {
          Get.offNamed("/donar");
        }
      },
    );
  }
}
