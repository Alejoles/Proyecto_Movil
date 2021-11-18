import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final CollectionReference pets =
      FirebaseFirestore.instance.collection('pets');

  final User? usuario = FirebaseAuth.instance.currentUser;

  final String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  Future saveNewPet(String petName, String petPicture, String description,
      String phoneNumber) async {
    final send = await pets.add({
      'uid': uid,
      'uName': usuario!.displayName.toString(),
      'phone': phoneNumber,
      'petName': petName,
      'description': description,
      'petPicture': petPicture
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
}
