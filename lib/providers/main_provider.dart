import 'package:flutter/material.dart';

import '../models/Ressource.dart';
import '../models/StoreItem.dart';

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

  void craftItem(StoreItem item) {
    for (var ressource in item.cost.keys) {
      var ressourceIndex = ressourceList.indexWhere((element) => element.name == ressource);
      if (ressourceIndex != -1) {
        ressourceList[ressourceIndex].counter -= item.cost[ressource]!;
      }
    }
    notifyListeners();
  }

  // -----
  // The list of StoreItem
  // -----

  List<StoreItem> storeItemList = [
    StoreItem(
      name: 'Hache',
      type: 'Outil',
      cost: {
        'Bois': 2,
        'Tige en métal': 2,
      },
      description: 'Un outil utile pour couper du bois',
    ),
    StoreItem(
      name: 'Pioche',
      type: 'Outil',
      cost: {
        'Bois': 2,
        'Tige en métal': 3,
      },
      description: 'Un outil utile pour miner du minerai',
    ),
    StoreItem(
      name: 'Lingot de fer',
      type: 'Matériau',
      cost: {
        'Minerai de fer': 1,
      },
      description: 'Un lingot de fer pur',
    ),
    StoreItem(
      name: 'Plaque de fer',
      type: 'Matériau',
      cost: {
        'Minerai de fer': 3,
      },
      description: 'Une plaque de fer pour la construction',
    ),
    StoreItem(
      name: 'Lingot de cuivre',
      type: 'Matériau',
      cost: {
        'Minerai de cuivre': 1,
      },
      description: 'Un lingot de cuivre pur',
    ),
    StoreItem(
      name: 'Tige en métal',
      type: 'Matière première',
      cost: {
        'Lingot de fer': 2,
      },
      description: 'Une tige en métal',
    ),
    StoreItem(
      name: 'Fil électrique',
      type: 'Composant',
      cost: {
        'Lingot de cuivre': 1,
      },
      description:
          'Un fil électrique pour fabriquer des composants électroniques',
    )
  ];
}
