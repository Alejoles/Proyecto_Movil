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
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: List.generate(20, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }),
        // TODO: hacer un footer en el que se pueda cambiar de página
      ),
      drawer: const SideList(),
    );
  }
}
