import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/services/db_service.dart';
import 'package:prueba_proyecto/ui/widgets/nav_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AdoptaPage extends GetView<DatabaseService> {
  const AdoptaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Adopta :)'),
          backgroundColor: Colors.purple,
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.purple.shade100,
                  Colors.lightBlue.shade100,
                  Colors.purple.shade300
                ])),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('pets').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return LinearProgressIndicator();
                return GridView.count(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  children: snapshot.data!.docs.map((pets) {
                    return Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [BoxShadow(blurRadius: 7)],
                          color: Colors.white),
                      child: GestureDetector(
                        onTap: () async {
                          await _openPopup(context, pets.id);
                        },
                        child: Column(children: [
                          Image.network(
                            pets['petPicture'],
                            fit: BoxFit.cover,
                            height: 110,
                          ),
                          Text(
                            pets['petName'],
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(pets['location'])
                        ]),
                      ),
                    );
                  }).toList(),
                );
              },
            )));
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
        print(listReturned);
      } else {
        print('Document does not exist on the database');
      }
    });
    await Future.delayed(const Duration(milliseconds: 400), () {});
    Alert(
        context: context,
        title: "Conoce al peludo",
        content: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(listReturned[2]),
            ),
            SizedBox(
              height: 10,
            ),
            Text(listReturned[0]),
            SizedBox(
              height: 10,
            ),
            Text(listReturned[1]),
            SizedBox(
              height: 10,
            ),
            Row(children: [Icon(Icons.phone), Text('  ' + listReturned[4])]),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            child: const Text(
              "Cerrar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
