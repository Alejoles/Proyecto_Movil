import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/services/db_service.dart';

class PonerAdopcionPage extends GetView<DatabaseService> {
  TextEditingController nombrePet = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController imagen = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
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
                  margin: EdgeInsets.only(bottom: 25),
                  height: 100,
                  width: 150,
                  child: GestureDetector(
                    onTap: () => {}, //TODO: cambiar la foto
                    child: CircleAvatar(
                      radius: 80,
                      child: Text("Agrega una imagen"),
                    ),
                  )),
            ),
          ],
        ),
        SizedBox(
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
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent))),
          ),
        ),
        SizedBox(
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
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                alignLabelWithHint: true,
                labelText: "Número de contacto",
                hintText: "3198765420",
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
            controller: phoneNumber,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
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
            onPressed: () => {
              controller.saveNewPet(nombrePet.text, imagen.text,
                  descripcion.text, phoneNumber.text)
            },
            child: Text("Poner en adopción"),
          ),
        )
      ],
    ));
  }
}
