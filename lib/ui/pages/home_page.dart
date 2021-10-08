import 'package:flutter/material.dart';
import 'package:prueba_proyecto/ui/widgets/side_list.dart';
import 'package:prueba_proyecto/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Container horizontalListAdoptar() {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: Wrap(
          children: [],
        ),
      ),
    );
  }

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
                padding: const EdgeInsets.symmetric(vertical: 15),
                height: 400,
                width: double.infinity,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Hola yo soy...",
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
                            // TODO: llevar a la página de adopción
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
