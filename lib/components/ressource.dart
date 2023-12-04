import 'package:flutter/material.dart';
import 'package:miner_game/models/Ressource.dart';

class RessourceWidget extends StatelessWidget {
  /// Widget that displays a ressource
  ///
  /// [ressource] ressources list is defined in [providers/main_provider.dart]
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
      color: ressource.isUnlocked ? ressource.color : Colors.grey,
      child: InkWell(
        onTap: ressource.isUnlocked
            ? onMinePressed
            : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${ressource.name} est verrouillé, il vous faut ${ressource.condition}',
                    ),
                  ),
                );
              },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(ressource.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ressource.isUnlocked ? Colors.white : Colors.black38,
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: ressource.isUnlocked ? onMinePressed : null,
                icon: const Icon(Icons.add),
                label: const Text('Miner'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                ressource.counter.toString(),
                style: TextStyle(
                  fontSize: 22,
                  color: ressource.isUnlocked ? Colors.white : Colors.black38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
