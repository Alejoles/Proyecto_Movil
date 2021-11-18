import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/bindings/dashboard_binding.dart';
import 'package:prueba_proyecto/ui/pages/dashboard.dart';
import 'package:prueba_proyecto/ui/pages/register_page.dart';
import 'package:prueba_proyecto/ui/pages/tus_peludos_page.dart';
import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  get binding => DashBoardBinding();

  // Maneja el estado de la aplicación para que al entrar no pida login si ya la sesión está abierta.
  void initState() {
    late StreamSubscription<User?> user;
    user = FirebaseAuth.instance.authStateChanges().listen((user) {});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Huellas a Casa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null ||
              FirebaseAuth.instance.currentUser!.displayName == null
          ? "/login"
          : "/",
      getPages: [
        GetPage(
            name: "/login",
            page: () => const MyLoginPage(),
            binding: DashBoardBinding()),
        GetPage(
            name: "/register",
            page: () => const MyRegisterPage(),
            binding: DashBoardBinding()),
        GetPage(
            name: "/",
            page: () => const MyDashBoard(),
            binding: DashBoardBinding()),
        GetPage(name: "/tuspeludos", page: () => const TusPeludosPage())
      ],
    );
  }
}
