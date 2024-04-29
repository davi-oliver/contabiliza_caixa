class StockInfo {
  final Stock? stock;
  final Company? company;
  final Product? product;

  StockInfo({
    required this.stock,
    required this.company,
    required this.product,
  });

  factory StockInfo.fromJson(Map<String, dynamic> json) {
    return StockInfo(
      stock: Stock.fromJson(json['stock']),
      company: Company.fromJson(json['company']),
      product: Product.fromJson(json['product']),
    );
  }
}

class Stock {
  final int id;
  final String createdAt;
  final int productId;
  final int companyId;
  final int quantityPurchased;
  final double purchasePrice;

  Stock({
    required this.id,
    required this.createdAt,
    required this.productId,
    required this.companyId,
    required this.quantityPurchased,
    required this.purchasePrice,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      id: json['id'],
      createdAt: json['created_at'],
      productId: json['product_id'],
      companyId: json['company_id'],
      quantityPurchased: json['quantity_purchased'],
      purchasePrice: json['purchase_price'],
    );
  }
}

class Company {
  final int id;
  final String name;

  Company({
    required this.id,
    required this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Product {
  final int id;
  final String name;

  Product({
    required this.id,
    required this.name,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
    );
  }
}