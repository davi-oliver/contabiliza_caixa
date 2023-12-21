class Product {
  final int id;
  final String createdAt;
  final String name;
  final dynamic price;
  final dynamic amount;

  Product({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.price,
    required this.amount,
  });

  factory Product.fromJson( json) {
    return Product(
      id: json['id'],
      createdAt: json['created_at'] ?? "",
      name: json['name'],
      price: json['price'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'name': name,
      'price': price,
      'amount': amount,
    };
  }
}