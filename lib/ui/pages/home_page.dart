import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_proyecto/ui/pages/adopta_page.dart';
import 'package:prueba_proyecto/ui/widgets/side_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
        ],
        centerTitle: true,
        title: const Text('Huellas a casa Icon'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.red,
                child: const Text("Hola yo soy... FOTO ; Adoptame"),
              ),
              Container(
                  height: 400,
                  color: Colors.blue,
                  width: double.infinity,
                  child: const Text("Mas que un amigo compañero de vida FOTO")),
              Container(
                height: 400,
                color: Colors.green,
                width: double.infinity,
                child: const Text("Quienes somos? FOTO"),
              ),
              Container(
                height: 200,
                color: Colors.purple,
                width: double.infinity,
                child: const Text("Footer; Contacto..."),
              )
            ],
          ),
        ),
      ),
      // -- Se puede hacer una clase drawer para usarla en todas las paginas---
      drawer: const SideList(),
    );
  }
}
