import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class DatabaseService extends GetxController {
  final CollectionReference pets =
      FirebaseFirestore.instance.collection('pets');

  final User? usuario = FirebaseAuth.instance.currentUser;

  final String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  Future saveNewPet(String petName, String petPicture, String description,
      String phoneNumber, String location) async {
    final send = await pets.add({
      'uid': uid,
      'uName': usuario!.displayName.toString(),
      'phone': phoneNumber,
      'petName': petName,
      'description': description,
      'petPicture': petPicture,
      'location': location
    });

    return send.id.toString();
  }

  dynamic getPetById(String docId) async {
    var document = pets.doc(docId);
    document.get().then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        var listReturned = [
          documentSnapshot.get('petName'),
          documentSnapshot.get('description'),
          documentSnapshot.get('petPicture'),
          documentSnapshot.get('uName'),
          documentSnapshot.get('phone')
        ];
        return Future.value(listReturned);
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  final FirebaseStorage storage = FirebaseStorage.instance;
  final photoName = "".obs;

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

  String changePhotoName(String newname) {
    photoName.update((model) {
      photoName.value = newname;
      model = newname;
    });
    print(photoName);
    update();
    return "";
  }
}
