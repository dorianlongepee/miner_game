import 'dart:math';

import 'package:flutter/material.dart';
import 'package:miner_game/models/Ressource.dart';
import 'package:miner_game/providers/main_provider.dart';
import 'package:provider/provider.dart';

class RandomMiner extends StatefulWidget {
  @override
  _RandomMinerState createState() => _RandomMinerState();
}

class _RandomMinerState extends State<RandomMiner> {
  Offset? _startPosition;
  Offset? _currentPosition;
  Offset _position = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        _startPosition = details.globalPosition;
      },
      onPanUpdate: (details) {
        _currentPosition = details.localPosition;
        if (_startPosition != null) {
          double deltaX = _currentPosition!.dx - _startPosition!.dx;
          double deltaY = _currentPosition!.dy - _startPosition!.dy;

          // Check for significant change in direction
          if (deltaX.abs() > 50 && deltaY.abs() > 50) {
            if (deltaX > 0 && deltaY < 0) {
              // Call your method for hard right to north east
              _handleDirectionChange();
            }
          }

          setState(() {
            _position = Offset(deltaX, deltaY);
          });
        }
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        transform: Matrix4.translationValues(_position.dx, _position.dy, 0),
      ),
    );
  }

  void _handleDirectionChange() {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    Random random = Random();
    Ressource randomResource = mainProvider.ressourceList[random.nextInt(
        mainProvider.ressourceList
            .where((element) => element.isUnlocked)
            .length)];
    mainProvider.mineResource(randomResource);
  }
}
