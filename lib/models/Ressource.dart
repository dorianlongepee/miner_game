import 'package:flutter/material.dart';

class Ressource {
  final String name;
  final Color color;
  final String description;
  bool isUnlocked;
  int counter;
  String condition;

  Ressource({
    required this.name,
    required this.color,
    required this.description,
    this.isUnlocked = false,
    this.counter = 0,
    this.condition = '',
  });
}
