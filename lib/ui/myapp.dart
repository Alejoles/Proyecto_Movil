import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/bindings/dashboard_binding.dart';
import 'package:prueba_proyecto/common/constants.dart';
import 'package:prueba_proyecto/ui/pages/adopta_page.dart';
import 'package:prueba_proyecto/ui/pages/dashboard.dart';
import 'package:prueba_proyecto/ui/pages/donar_page.dart';
import 'package:prueba_proyecto/ui/pages/poner_adopcion_page.dart';
import 'package:prueba_proyecto/ui/widgets/nav_bar.dart';
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
      initialRoute: "/",
      getPages: [
        GetPage(
            name: "/",
            page: () => const MyDashBoard(),
            binding: DashBoardBinding()),
      ],
    );
  }
}
