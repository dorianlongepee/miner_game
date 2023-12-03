import 'package:flutter/material.dart';

class Ressource {
  final String name;
  final Color color;
  final String description;
  int counter;

  Ressource({
    required this.name,
    required this.color,
    required this.description,
    this.counter = 0,
  });
}
