class Armor {
  bool equipped;
  String name;
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
      this.type = "",
      required this.armorClass,
      this.characteristic = "",
      this.cost = "",
      this.strength = 0,
      this.stealth = false,
      this.weight = "",
      this.info = ""});

  factory Armor.fromJson(Map<String, dynamic> json) {
    return Armor(
        equipped: json['equipped'] ?? false,
        name: json['name'],
        type: json['type'],
        armorClass: json['armorClass'],
        characteristic: json['characteristic'],
        cost: json['cost'],
        strength: json['strength'],
        stealth: json['stealth'],
        weight: json['weight'],
        info: json['info']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['equipped'] = equipped;
    data['name'] = name;
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
}
