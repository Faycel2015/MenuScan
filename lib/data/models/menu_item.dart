class MenuItem {
  final String id;
  final String name;
  final double price;
  final String category;
  final String? description;

  MenuItem({
    String? id,
    required this.name,
    required this.price,
    required this.category,
    this.description,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'category': category,
    'description': description,
  };

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
    id: json['id'] as String?,
    name: json['name'] as String,
    price: (json['price'] as num).toDouble(),
    category: json['category'] as String,
    description: json['description'] as String?,
  );

  MenuItem copyWith({
    String? id,
    String? name,
    double? price,
    String? category,
    String? description,
  }) => MenuItem(
    id: id ?? this.id,
    name: name ?? this.name,
    price: price ?? this.price,
    category: category ?? this.category,
    description: description ?? this.description,
  );
}
