import 'package:flutter/material.dart';
import 'package:prueba_proyecto/ui/widgets/side_list.dart';

class PonerAdopcionPage extends StatelessWidget {
  const PonerAdopcionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
        ],
        centerTitle: true,
        title: const Text('Poner en adopción'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(),
      ),
      drawer: const SideList(),
    );
  }
}
