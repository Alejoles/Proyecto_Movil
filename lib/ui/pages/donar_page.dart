import 'package:flutter/material.dart';
import 'package:prueba_proyecto/ui/widgets/nav_bar.dart';

class DonarPage extends StatelessWidget {
  const DonarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dónanos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const SingleChildScrollView(
        child: Center(),
      ),
    );
  }
}
