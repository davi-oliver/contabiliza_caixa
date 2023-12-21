
class ItemType {
  final String name;
  final int id;

  ItemType(this.name, this.id);

  ItemType.fromJson( json)
      : name = json['nome'] == null ? json['name']  : json['nome'],
        id = json['id'] == null ? 0 : json['id'];
}