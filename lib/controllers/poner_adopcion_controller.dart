import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PonerAdopcionController extends GetxController {
  Future<void> getFireStore() async {
    CollectionReference categories =
        FirebaseFirestore.instance.collection('pets');
    DocumentSnapshot snapshot = await categories.doc("perro1").get();
  }
}
