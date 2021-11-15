import 'package:flutter/material.dart';
import 'package:prueba_proyecto/ui/widgets/nav_bar.dart';

class AdoptaPage extends StatelessWidget {
  const AdoptaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Adopta :)'),
          backgroundColor: Colors.purple,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.purple.shade100,
                Colors.lightBlue.shade100,
                Colors.purple.shade300
              ])),
          child: GridView.count(
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
        ));
  }
}
