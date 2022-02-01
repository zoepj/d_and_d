class Armor {
  bool equipped;
  String name;
  int id;
  String type;
  int armorClass;
  String characteristic;
  String cost;
  int strength;
  bool stealth;
  String weight;
  String info;

  Armor(
      {this.equipped = false,
      required this.name,
      required this.id,
      this.type = "",
      this.armorClass = 0,
      this.characteristic = "",
      this.cost = "",
      this.strength = 0,
      this.stealth = false,
      this.weight = "",
      this.info = ""});

  factory Armor.fromJson(Map<String, dynamic> json) {
    return Armor(
      equipped: (json['equipped'] == "true"),
      name: json['name'],
      id: int.parse(json['id']),
      type: json['type'],
      armorClass: int.parse(json['armorClass']),
      characteristic: json['characteristic'],
      cost: json['cost'],
      strength: int.parse(json['strength']),
      stealth: json['stealth'] == "true",
      weight: json['weight'],
      info: json['info'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['equipped'] = equipped;
    data['name'] = name;
    data['id'] = id;
    data['type'] = type;
    data['armorClass'] = armorClass;
    data['characteristic'] = characteristic;
    data['cost'] = cost;
    data['strength'] = strength;
    data['stealth'] = stealth;
    data['weight'] = weight;
    data['info'] = info;
    return data;
  }

  @override
  String toString() {
    return '{"equipped": "' +
        equipped.toString() +
        '", "name": "' +
        name +
        '", "id": "' +
        id.toString() +
        '", "type": "' +
        type +
        '", "armorClass": "' +
        armorClass.toString() +
        '", "characteristic": "' +
        characteristic +
        '", "cost": "' +
        cost +
        '", "strength": "' +
        strength.toString() +
        '", "stealth": "' +
        stealth.toString() +
        '", "weight": "' +
        weight +
        '", "info": "' +
        info +
        '"}';
  }
}
