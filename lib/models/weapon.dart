class Weapon {
  int ammunition;
  String name;
  int id;
  String type;
  String damage;
  String cost;
  String weight;
  String features;
  String info;

  Weapon(
      {this.ammunition = 0,
      required this.name,
      required this.id,
      this.type = "",
      this.damage = "",
      this.cost = "",
      this.weight = "",
      this.features = "",
      this.info = ""});

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
      ammunition: int.parse(json['ammunition']),
      name: json['name'],
      id: int.parse(json['id']),
      type: json['type'],
      damage: json['damage'],
      cost: json['cost'],
      weight: json['weight'],
      features: json['features'],
      info: json['info'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ammunition'] = ammunition;
    data['name'] = name;
    data['id'] = id;
    data['type'] = type;
    data['damage'] = damage;
    data['cost'] = cost;
    data['weight'] = weight;
    data['features'] = features;
    data['info'] = info;
    return data;
  }

  @override
  String toString() {
    return '{"ammunition": "' +
        ammunition.toString() +
        '", "name": "' +
        name +
        '", "id": "' +
        id.toString() +
        '", "type": "' +
        type +
        '", "damage": "' +
        damage +
        '", "cost": "' +
        cost +
        '", "weight": "' +
        weight +
        '", "features": "' +
        features +
        '", "info": "' +
        info +
        '"}';
  }
}
