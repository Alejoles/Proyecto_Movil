import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class Storage extends GetxController {
  final FirebaseStorage storage = FirebaseStorage.instance;
  String photoName = "";

  Future<void> uploadFile(String filepath, String filename) async {
    File file = File(filepath);

    try {
      await storage.ref('petImages/$filename').putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String> downloadURL(String imageName) async {
    String downloadUrl =
        await storage.ref('petImages/$imageName').getDownloadURL();

    return downloadUrl;
  }

  void changePhotoName(String newname) {
    photoName = newname;
    print(photoName);
  }
}
