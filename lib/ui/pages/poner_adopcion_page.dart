import 'package:flutter/material.dart';
import 'package:prueba_proyecto/ui/widgets/nav_bar.dart';

class PonerAdopcionPage extends StatelessWidget {
  const PonerAdopcionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Poner en adopción'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(),
      ),
    );
  }
}
