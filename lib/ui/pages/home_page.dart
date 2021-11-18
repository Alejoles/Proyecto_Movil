import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/controllers/dashboard_controller.dart';
import 'package:prueba_proyecto/ui/pages/adopta_page.dart';
import 'package:prueba_proyecto/ui/widgets/nav_bar.dart';
import 'package:prueba_proyecto/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  Container horizontalListAdoptar() {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 10, color: Colors.deepPurple)]),
          child: Card(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/perromuestra1.jpg',
                  fit: BoxFit.fitHeight,
                  height: 200,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bruno",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Bogotá")
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent, //TODO: Transparente
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  height: 400,
                  width: double.infinity,
                  //color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Hola! Yo soy...",
                        style: TextStyle(fontSize: 30),
                      ),
                      Expanded(
                          child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        children: [
                          horizontalListAdoptar(),
                          horizontalListAdoptar(),
                          horizontalListAdoptar(),
                          horizontalListAdoptar(),
                          horizontalListAdoptar(),
                          FloatingActionButton(
                            onPressed: () => {
                              Get.offNamed("/"),
                            },
                            child: const Icon(Icons.add),
                            backgroundColor: Colors.amber,
                          )
                        ],
                      )),
                      const Text(
                        "Adóptame!",
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 218,
                  color: Colors.transparent,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/cocker.jpg',
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  color: Colors.green,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/cat.jpg',
                        fit: BoxFit.cover,
                        height: 400,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // -- Se puede hacer una clase drawer para usarla en todas las paginas---
        ));
  }
}
