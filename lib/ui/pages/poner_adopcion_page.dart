import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/model/storage_service.dart';
import 'package:prueba_proyecto/services/db_service.dart';

class PonerAdopcionPage extends GetView<DatabaseService> {
  final Storage storage = Storage();

  TextEditingController nombrePet = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController imagen = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController namefilephotolocal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var activarfoto = false;
    return SingleChildScrollView(
        child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20, color: Colors.blueGrey, spreadRadius: 5)
                ],
              ),
            ),
            Container(
                height: 175,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  height: 100,
                  width: 150,
                  child: GestureDetector(
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                                allowMultiple: false,
                                type: FileType.custom,
                                allowedExtensions: ['jpg', 'png', 'jpeg']);
                        if (result == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("No se seleccionó imagen")));
                        } else {
                          final path = result.files.first.path!;
                          final fileName = result.files.first.name;
                          namefilephotolocal.text = fileName;
                          controller.changePhotoName(fileName);
                          controller.uploadFile(path, fileName).then(
                            (value) async {
                              print('Hecho');
                              var url = await FirebaseStorage.instance
                                  .ref('petImages/$fileName')
                                  .getDownloadURL();
                              imagen.text = url;
                            },
                          );
                        }
                      },
                      child: Obx(() => CircleAvatar(
                          radius: 80,
                          child: FutureBuilder(
                            future: controller.downloadURL(
                                Get.find<DatabaseService>().photoName.string),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.hasData) {
                                return CircleAvatar(
                                    radius: 70,
                                    backgroundImage: NetworkImage(
                                      snapshot.data!,
                                    ));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                print(imagen.text);
                                return CircularProgressIndicator();
                              }
                              print(snapshot);
                              return Text("Agregue una imagen");
                            },
                          )))),
                )),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: nombrePet,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                alignLabelWithHint: true,
                labelText: "Nombre del Peludo",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent))),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            inputFormatters: [LengthLimitingTextInputFormatter(200)],
            controller: descripcion,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                alignLabelWithHint: true,
                labelText: "Descripción",
                hintText: "Años del peludo, vacunas, cuidados...",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent))),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: phoneNumber,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                alignLabelWithHint: true,
                labelText: "Número de contacto",
                hintText: "319 876 5420",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent))),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: location,
            inputFormatters: [
              LengthLimitingTextInputFormatter(15),
            ],
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                alignLabelWithHint: true,
                labelText: "Ubicación",
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent))),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: ElevatedButton(
            onPressed: () {
              if (nombrePet.text.length < 3) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Ingrese un nombre para su peludo")));
                return;
              }
              if (phoneNumber.text.length < 10) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Ingrese un Número telefoníco válido")));
                return;
              }
              controller.saveNewPet(nombrePet.text, imagen.text,
                  descripcion.text, phoneNumber.text, location.text);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text("Peludo ${nombrePet.text} listado para adopción")));
              nombrePet.text = "";
              descripcion.text = "";
              imagen.text = "";
              phoneNumber.text = "";
              location.text = "";
              controller.changePhotoName("");
            },
            child: Text("Poner en adopción"),
          ),
        )
      ],
    ));
  }
}
