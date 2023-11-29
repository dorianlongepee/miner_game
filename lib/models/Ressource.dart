import 'package:flutter/material.dart';

class Ressource {
  String name;
  Color color;
  String description;
  int counter;

  Ressource({
    required this.name,
    required this.color,
    required this.description,
    this.counter = 0,
  });
}
