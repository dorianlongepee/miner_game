import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/StoreItem.dart';
import '../providers/main_provider.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    List<StoreItem> inventory = Provider.of<MainProvider>(context).inventory;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Inventaire'),
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<MainProvider>(context, listen: false)
                    .sortInventoryByName();
              },
              icon: const Icon(Icons.sort_by_alpha),
            ),
            IconButton(
                onPressed: () {
                  Provider.of<MainProvider>(context, listen: false)
                      .sortInventoryByQuantity();
                },
                icon: const Icon(Icons.sort_rounded)),
          ],
        ),
        body: ListView.builder(
          itemCount: inventory.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  '${inventory[index].name} x${inventory[index].quantity}'),
            );
          },
        ));
  }
}
