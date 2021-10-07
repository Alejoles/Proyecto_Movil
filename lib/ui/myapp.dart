import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/common/constants.dart';
import 'package:prueba_proyecto/ui/pages/adopta_page.dart';
import 'package:prueba_proyecto/ui/pages/donar_page.dart';
import 'package:prueba_proyecto/ui/pages/poner_adopcion_page.dart';
import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Huellas a Casa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HOME_ROUTE,
      getPages: [
        GetPage(name: HOME_ROUTE, page: () => const HomePage()),
        GetPage(name: ADOPTA_ROUTE, page: () => const AdoptaPage()),
        GetPage(
            name: PONER_ADOPCION_ROUTE, page: () => const PonerAdopcionPage()),
        GetPage(name: DONAR_ROUTE, page: () => const DonarPage()),
      ],
    );
  }
}
