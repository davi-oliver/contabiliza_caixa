class Users {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? createdAt;

  Users({this.id, this.name, this.email, this.phone, this.createdAt});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    return data;
  }
}