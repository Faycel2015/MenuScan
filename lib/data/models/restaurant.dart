import 'menu_item.dart';

class Restaurant {
  final String id;
  final String name;
  final String imagePath;
  final List<MenuItem> menuItems;
  final DateTime createdAt;

  Restaurant({
    String? id,
    required this.name,
    required this.imagePath,
    required this.menuItems,
    DateTime? createdAt,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
       createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imagePath': imagePath,
    'menuItems': menuItems.map((item) => item.toJson()).toList(),
    'createdAt': createdAt.toIso8601String(),
  };

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json['id'] as String?,
    name: json['name'] as String,
    imagePath: json['imagePath'] as String,
    menuItems: (json['menuItems'] as List)
        .map((item) => MenuItem.fromJson(item))
        .toList(),
    createdAt: DateTime.parse(json['createdAt'] as String),
  );
}
