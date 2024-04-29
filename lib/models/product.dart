class Product {
  final int? id;
  final String? createdAt;
  final String? name;
  final String? description;
  final double? price;
  final int? quantityStock;
  final int? unity;
  final String? dateFabrication;
  final String? expirationDate;
  final String? lote;
  final String? barcode;

  Product({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.price,
    required this.quantityStock,
    required this.unity,
    required this.dateFabrication,
    required this.expirationDate,
    this.lote,
    this.barcode,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      createdAt: json['created_at'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantityStock: json['quantity_stock'],
      unity: json['unity'],
      dateFabrication: json['date_fabrication'],
      expirationDate: json['expiration_date'],
      lote: json['lote'],
      barcode: json['barcode'],
    );
  }
}
