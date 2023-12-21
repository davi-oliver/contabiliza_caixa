

class ClientInfo {
  String? name;
  int? id;

  ClientInfo({this.name, this.id});

  ClientInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
}