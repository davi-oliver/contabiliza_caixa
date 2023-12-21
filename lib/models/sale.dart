import 'package:ga_proj/models/product.dart';
import 'package:ga_proj/models/users.dart';

class SaleModel {
  int? id;
  String? createdAt;
  int? userId;
  int? productId;
  String? geo;
  int? quantity;
  int? price;
  int? total;
  Product? product;
  Users? users;

  SaleModel(
      {this.id,
      this.createdAt,
      this.userId,
      this.productId,
      this.geo,
      this.quantity,
      this.price,
      this.total,
      this.product,
      this.users});

  SaleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    productId = json['product_id'];
    geo = json['geo'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['geo'] = this.geo;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total'] = this.total;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}
