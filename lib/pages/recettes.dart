import 'package:flutter/material.dart';

class Recettes extends StatefulWidget {
  const Recettes({Key? key}) : super(key: key);
  @override
  _RecettesState createState() => _RecettesState();
}

class _RecettesState extends State<Recettes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Recettes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Recettes',
            ),
          ],
        ),
      ),
    );
  }
}
