import 'package:flutter/material.dart';
import 'package:miner_game/models/StoreItem.dart';

class StoreItemCard extends StatelessWidget {
  final StoreItem item;
  final bool canBuy;
  final VoidCallback onBuyPressed;

  StoreItemCard(
      {required this.item, required this.canBuy, required this.onBuyPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Text(
                  item.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Coût: ${formatCost(item.cost)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: canBuy ? onBuyPressed : null,
              child: Text('Fabriquer'),
            ),
          ],
        ),
      ),
    );
  }

  String formatCost(Map<String, int> cost) {
    var costString = '';
    cost.forEach((mineral, quantity) {
      costString += '$quantity $mineral, ';
    });
    return costString.substring(
        0, costString.length - 2); // Supprimer la virgule finale
  }
}
