import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/home_controller.dart';

var selectedHome = true;
var selectedAdoptar = false;
var selectedPonerAdopcion = false;
var selectedDonar = false;

class SideList extends StatelessWidget {
  const SideList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("accountName"),
            accountEmail: Text("accountEmail"),
            currentAccountPicture: Icon(Icons.pets_rounded),
            decoration: BoxDecoration(color: Colors.purpleAccent),
          ),
          const Divider(
            thickness: 8,
            endIndent: 20,
            height: 0,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Inicio"),
            onTap: () => {
              Get.offNamed("/home"),
              selectedHome = true,
              selectedAdoptar = false,
              selectedPonerAdopcion = false,
              selectedDonar = false,
            },
            selected: selectedHome,
          ),
          ListTile(
            leading: const Icon(Icons.catching_pokemon_outlined),
            title: const Text("Adopta tu peludo"),
            onTap: () => {
              //Navigator.popUntil(context, ModalRoute.withName('/home')),
              Get.offNamed("/adopta"),
              selectedHome = false,
              selectedAdoptar = true,
              selectedPonerAdopcion = false,
              selectedDonar = false,
            },
            selected: selectedAdoptar,
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.pets_sharp),
            title: const Text("Poner en adopción"),
            onTap: () => {
              //Navigator.popUntil(context, ModalRoute.withName('/home')),
              Get.offNamed("/adopcion"),
              selectedHome = false,
              selectedAdoptar = false,
              selectedPonerAdopcion = true,
              selectedDonar = false,
            },
            selected: selectedPonerAdopcion,
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text("Donar"),
            onTap: () => {
              Get.offNamed("/donar"),
              selectedHome = false,
              selectedAdoptar = false,
              selectedPonerAdopcion = false,
              selectedDonar = true,
            },
            selected: selectedDonar,
            enabled: false,
          ),
        ],
      ),
    );
  }
}
