class StoreItem {
  final String name;
  final String description;
  final Map<String, int> cost;
  final String type;
  int quantity;

  StoreItem({
    required this.name,
    required this.description,
    required this.cost,
    required this.type,
    this.quantity = 0,
  });
}
