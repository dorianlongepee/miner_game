import 'package:flutter/material.dart';

import '../models/Ressource.dart';
import '../models/StoreItem.dart';

class MainProvider extends ChangeNotifier {
  /// This provider is used to store the state of the app and some data

  // The list of ressources
  List<Ressource> ressourceList = [
    Ressource(
        color: const Color(0xFF967969),
        name: 'Bois',
        description: 'Du bois brut',
        isUnlocked: true),
    Ressource(
        color: const Color(0xFFced4da),
        name: 'Minerai de fer',
        description: 'Du minerai de fer brut',
        isUnlocked: true),
    Ressource(
        color: const Color.fromARGB(255, 47, 32, 25),
        name: 'Minerai de cuivre',
        description: 'Du minerai de cuivre brut',
        isUnlocked: true),
    Ressource(
        color: const Color(0xFF000000),
        name: 'Charbon',
        description: 'Du minerai de charbon',
        isUnlocked: false,
        condition: '1000 Lingots de fer et 1000 Lingots de cuivre'),
  ];

  void mineResource(Ressource ressource) {
    /// Mine a ressource.
    ///
    /// This function will increment the counter of the ressource
    /// depending on the tools the user has.
    if (ressource.name == 'Bois' &&
        inventory.indexWhere((element) => element.name == 'Hache') != -1) {
      ressource.counter += 3 *
          inventory.firstWhere((element) => element.name == 'Hache').quantity;
    } else if ((ressource.name == 'Minerai de fer' ||
            ressource.name == 'Minerai de cuivre' ||
            ressource.name == 'Charbon') &&
        inventory.indexWhere((element) => element.name == 'Pioche') != -1) {
      ressource.counter += 5 *
          inventory.firstWhere((element) => element.name == 'Pioche').quantity;
    } else {
      ressource.counter++;
    }
    checkUnlockedRessources();
    notifyListeners();
  }

  void checkUnlockedRessources() {
    /// Check if a ressource is unlocked.
    ///
    /// This function will check if a ressource is unlocked after mining or crafting
    /// and if it is, it will unlock it.
    for (var ressource in ressourceList) {
      if (ressource.isUnlocked == false) {
        if (ressource.name == 'Charbon') {
          ressource.isUnlocked = true;
        }
      }
    }
  }

  void craftItem(StoreItem item) {
    /// Craft an item.
    ///
    /// This function will remove the cost of the item
    /// from the ressources or the inventory
    /// and add the item to the inventory.
    for (var ressource in item.cost.keys) {
      var ressourceIndex =
          ressourceList.indexWhere((element) => element.name == ressource);
      var inventoryIndex =
          inventory.indexWhere((element) => element.name == ressource);
      if (ressourceIndex != -1) {
        ressourceList[ressourceIndex].counter -= item.cost[ressource]!;
      } else if (inventoryIndex != -1) {
        inventory[inventoryIndex].quantity -= item.cost[ressource]!;
        if (inventory[inventoryIndex].quantity == 0) {
          inventory.removeAt(inventoryIndex);
        }
      }
    }
    var existingItemIndex =
        inventory.indexWhere((element) => element.name == item.name);
    if (existingItemIndex != -1) {
      inventory[existingItemIndex].quantity++;
    } else {
      inventory.add(item);
      inventory.last.quantity = 1;
    }
    checkUnlockedRessources();
    notifyListeners();
  }

  // The list of StoreItem
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

  // Inventory related
  List<StoreItem> inventory = [];

  void sortInventoryByName() {
    inventory.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void sortInventoryByQuantity() {
    inventory.sort((a, b) => b.quantity.compareTo(a.quantity));
    notifyListeners();
  }
}
