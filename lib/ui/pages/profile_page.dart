import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/authentication_controller.dart';

class ProfilePage extends GetView<AuthenticationController> {
  const ProfilePage({Key? key}) : super(key: key);

  get user => controller.currentUser?.displayName;

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
            child: Text(
              FirebaseAuth.instance.currentUser!.displayName.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
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
}
