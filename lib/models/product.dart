
class Product {
  int? id;
  String? name;
  int? price;
  int? amount;
  String? createdAt;

  Product({this.id, this.name, this.price, this.amount, this.createdAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    amount = json['amount'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    return data;
  }
}

