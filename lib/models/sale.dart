import 'package:ga_proj/models/product.dart';
import 'package:ga_proj/models/users.dart';

class SaleModel {
  final int id;
  final int userId;
  final int productId;
  final String geo;
  final int quantity;
  final dynamic price;
  final dynamic total;
  final int paymentType;
  final String createdAt;
   Product? product;
   Users? users;

  SaleModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.geo,
    required this.quantity,
    required this.price,
    required this.total,
    required this.paymentType,
    required this.createdAt,
    required this.product,
    required this.users,
  });

  factory SaleModel.fromJson(  json) {
    return SaleModel(
      id: json['id'],
      userId: json['user_id'],
      productId: json['product_id'],
      geo: json['geo'],
      quantity: json['quantity'],
      price: json['price'],
      total: json['total'],
      paymentType: json['payment_type'],
      createdAt: json['created_at'] ?? "",
      product: json == null? null : Product.fromJson(json['product']),
      users: json == null? null : Users.fromJson(json['users']),
    );
  }
}