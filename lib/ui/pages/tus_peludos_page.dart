import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TusPeludosPage extends StatelessWidget {
  const TusPeludosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tus Peludos"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('pets').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return ListView(
            children: snapshot.data!.docs.map((pets) {
              if (pets['uid'] == FirebaseAuth.instance.currentUser!.uid) {
                return ElevatedButton(
                    onPressed: () async {
                      await _openPopup(context, pets.id);
                    },
                    child: ListTile(
                      title: Text(pets['petName']),
                    ));
              } else
                return Container();
            }).toList(),
          );
        },
      ),
    );
  }

  _openPopup(context, String pets) async {
    var document = FirebaseFirestore.instance.collection('pets').doc(pets);
    var listReturned = [];
    document.get().then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        listReturned = [
          documentSnapshot.get('petName'),
          documentSnapshot.get('description'),
          documentSnapshot.get('petPicture'),
          documentSnapshot.get('uName'),
          documentSnapshot.get('phone'),
          documentSnapshot.get('location')
        ];
      } else {
        print('Document does not exist on the database');
      }
    });
    await Future.delayed(const Duration(milliseconds: 500), () {});
    Alert(
        context: context,
        title: "Revisa a tu Peludo",
        content: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(listReturned[2]),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(listReturned[0]),
            const SizedBox(
              height: 10,
            ),
            Text(listReturned[1]),
            const SizedBox(
              height: 10,
            ),
            Row(children: [Icon(Icons.phone), Text('  ' + listReturned[4])]),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              document.delete();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Peludo ${listReturned[0]} borrado")));
            },
            child: const Text(
              "Eliminar Peludo",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
