import 'package:flutter/material.dart';
import 'package:miner_game/components/store_item.dart';
import 'package:miner_game/models/Ressource.dart';
import 'package:miner_game/models/StoreItem.dart';
import 'package:miner_game/providers/main_provider.dart';
import 'package:provider/provider.dart';

import 'inventory.dart';

class Recettes extends StatefulWidget {
  const Recettes({Key? key}) : super(key: key);
  @override
  _RecettesState createState() => _RecettesState();
}

class _RecettesState extends State<Recettes> {
  @override
  Widget build(BuildContext context) {
    final MainProvider mainProvider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Recettes'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Inventory(),
                ),
              );
            },
            icon: const Icon(Icons.backpack),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: mainProvider.storeItemList.length,
        itemBuilder: (context, index) {
          return StoreItemCard(
            item: mainProvider.storeItemList[index],
            canBuy: canBuyItem(
                mainProvider.storeItemList[index], mainProvider.ressourceList),
            onBuyPressed: () {
              mainProvider.craftItem(mainProvider.storeItemList[index]);
            },
          );
        },
      ),
    );
  }

  bool canBuyItem(StoreItem item, List<Ressource> ressources) {
    for (var ressource in item.cost.keys) {
      var ressourceIndex =
          ressources.indexWhere((element) => element.name == ressource);
      var inventoryIndex = Provider.of<MainProvider>(context, listen: false)
          .inventory
          .indexWhere(
            (element) => element.name == ressource,
          );
      if (ressourceIndex == -1 ||
          ressources[ressourceIndex].counter < item.cost[ressource]!) {
        if (inventoryIndex == -1 ||
            Provider.of<MainProvider>(context, listen: false)
                    .inventory[inventoryIndex]
                    .quantity <
                item.cost[ressource]!) {
          return false;
        }
      }
    }
    return true;
  }
}
