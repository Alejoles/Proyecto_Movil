import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/authentication_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProfilePage extends GetView<AuthenticationController> {
  get user => controller.currentUser?.displayName;

  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.grey[200],
        child: Column(children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.purpleAccent.shade200,
                    Colors.lightBlue,
                    Colors.lightBlueAccent
                  ])),
            ),
            Container(
              color: Colors.grey[200],
              height: 100,
            ),
            Positioned(
                top: 100,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(blurRadius: 10, offset: Offset(0, 5))
                      ]),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                )),
            Container(
              height: 10,
              color: Colors.grey[200],
            ),
            Container(
              height: 10,
              color: Colors.grey[200],
            ),
            Container(
              height: 10,
              color: Colors.grey[200],
            )
          ]),
          SizedBox(
            height: 80,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                FirebaseAuth.instance.currentUser!.displayName.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  _openPopup(context);
                },
                icon: Image.asset(
                  "assets/images/pen.png",
                  height: 20,
                  width: 20,
                ),
              )
            ]),
          ),
          Container(
              height: 300,
              margin: const EdgeInsets.only(left: 30, right: 30),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, color: Colors.grey, offset: Offset(0, 5))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 4,
                              color: Colors.blue.withOpacity(0.5),
                              offset: Offset(0, 5))
                        ]),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(150, 50),
                              shadowColor: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Get.toNamed("/tuspeludos");
                          },
                          label: const Text("Tus Peludos"),
                          icon: Icon(Icons.pets_sharp),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 4,
                              color: Colors.blue.withOpacity(0.5),
                              offset: Offset(0, 5))
                        ]),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(150, 50),
                              shadowColor: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Get.offNamed("/login");
                          },
                          label: const Text("Sign out"),
                          icon: Icon(Icons.logout),
                        ),
                      )
                    ]),
              ))
        ]));
  }

  _openPopup(context) {
    Alert(
        context: context,
        title: "Cambiar de nombre",
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Introduzca su nuevo nombre',
              ),
              controller: nameController,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              if (nameRegExp.hasMatch(nameController.text) &&
                  nameController.text.length >= 2) {
                Navigator.pop(context);
                FirebaseAuth.instance.currentUser
                    ?.updateDisplayName(nameController.text);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Nombre de usuario cambiado con éxito")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Introduzca un nombre válido")));
              }
            },
            child: const Text(
              "Guardar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
