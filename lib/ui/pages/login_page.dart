import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/authentication_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<MyLoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 130,
                        width: 130,
                        height: 150,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/dog3.png"))),
                        )),
                    Positioned(
                        child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, 0.7),
                                blurRadius: 20,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey)),
                                controller: emailController),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Contraseña",
                                  hintStyle: TextStyle(color: Colors.grey)),
                              controller: passwordController,
                              obscureText: true,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                        controller.authStateChanges.listen((User? user) async {
                          if (user == null) {
                            Get.offNamed("/login");
                          } else {
                            var iduser = user.email;
                            if (user.displayName == null) {
                              _openPopup(context);
                            } else {
                              Get.offNamed("/");
                            }
                          }
                        }); //TODO: Realizar la asignación de nombre y telefono a la cuenta
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(142, 148, 251, 1),
                          elevation: 5),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                        onPressed: () => {
                              Get.offNamed("/register")
                            }, //TODO: Realizar el registro con pop-ups
                        child: const Text("No tienes cuenta? Registrate")),
                    const SizedBox(height: 5),
                    Column(
                      children: <Widget>[
                        const Text("Ingresa desde:"),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              iconSize: 40,
                              onPressed: () =>
                                  {}, //TODO: Hacer el OAuth para cada plataforma
                              icon: Image.asset("assets/images/google.png"),
                            ),
                            IconButton(
                              iconSize: 40,
                              onPressed: () => {},
                              icon: Image.asset("assets/images/facebook.png"),
                            ),
                            IconButton(
                              iconSize: 40,
                              onPressed: () => {},
                              icon: Image.asset("assets/images/apple.png"),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _openPopup(context) {
    Alert(
        context: context,
        title: "Ultimos pasos",
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Introduzca su nombre',
              ),
              controller: nameController,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                labelText: 'Su número de teléfono',
              ),
              controller: phoneController,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => {
              Navigator.pop(context),
              FirebaseAuth.instance.currentUser
                  ?.updateDisplayName(nameController.text),
              FirebaseAuth.instance.currentUser
                  ?.linkWithPhoneNumber(phoneController.text)
            },
            child: const Text(
              "GUARDAR",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
/*
class AuthenticationWrapper extends GetView<AuthenticationController> {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.authStateChanges.listen((User? user) {
      if (user == null) {
        print("User signed out");
      } else {
        print("Not signed in");
      }
    });
    return Container();
  }
}*/
