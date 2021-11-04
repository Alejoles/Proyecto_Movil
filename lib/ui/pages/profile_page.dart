import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/authentication_controller.dart';

class ProfilePage extends GetView<AuthenticationController> {
  const ProfilePage({Key? key}) : super(key: key);

  get user => controller.currentUser?.displayName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          print(user);
        },
        child: const Text("Sign out"),
      ),
    );
  }
}
