import 'package:flutter/material.dart';
import 'package:miner_game/models/Ressource.dart';

class RessourceWidget extends StatelessWidget {
  final Ressource ressource;
  final VoidCallback onMinePressed;

  const RessourceWidget({
    Key? key,
    required this.ressource,
    required this.onMinePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ressource.color,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ressource.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: onMinePressed,
              icon: const Icon(Icons.add),
              label: const Text('Miner'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              ressource.counter.toString(),
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
