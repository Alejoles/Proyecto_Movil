import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/bindings/dashboard_binding.dart';
import 'package:prueba_proyecto/bindings/login_binding.dart';
import 'package:prueba_proyecto/ui/pages/dashboard.dart';
import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Huellas a Casa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      getPages: [
        GetPage(
            name: "/login",
            page: () => const MyLoginPage(),
            binding: LoginBinding()),
        GetPage(
            name: "/",
            page: () => const MyDashBoard(),
            binding: DashBoardBinding()),
      ],
    );
  }
}
