import 'package:flutter/material.dart';

import '../models/Ressource.dart';

// This provider is used to store the state of the app and some data
class MainProvider extends ChangeNotifier {
  // -----
  // The list of ressources
  // -----

  List<Ressource> ressourceList = [
    Ressource(
      color: const Color(0xFF967969),
      name: 'Bois',
      description: 'Du bois brut',
    ),
    Ressource(
      color: const Color(0xFFced4da),
      name: 'Minerai de fer',
      description: 'Du minerai de fer brut',
    ),
    Ressource(
      color: const Color.fromARGB(255, 47, 32, 25),
      name: 'Minerai de cuivre',
      description: 'Du minerai de cuivre brut',
    ),
    Ressource(
      color: const Color(0xFF000000),
      name: 'Charbon',
      description: 'Du minerai de charbon',
    ),
  ];

  void mineResource(Ressource ressource) {
    ressource.counter++;
    notifyListeners();
  }
}
