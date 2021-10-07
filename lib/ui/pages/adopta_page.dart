import 'package:flutter/material.dart';
import 'package:prueba_proyecto/ui/widgets/side_list.dart';

class AdoptaPage extends StatelessWidget {
  const AdoptaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
        ],
        centerTitle: true,
        title: const Text('Adopta :)'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(),
      ),
      drawer: const SideList(),
    );
  }
}
