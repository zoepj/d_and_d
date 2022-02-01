class Weapon {
  int ammunition;
  String name;
  String type;
  String damage;
  String cost;
  String weight;
  String features;
  String info;

  Weapon(
      {this.ammunition = 0,
      required this.name,
      this.type = "",
      this.damage = "",
      this.cost = "",
      this.weight = "",
      this.features = "",
      this.info = ""});

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
        ammunition: json['ammunition'],
        name: json['name'],
        type: json['type'],
        damage: json['damage'],
        cost: json['cost'],
        weight: json['weight'],
        features: json['features'],
        info: json['info']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ammunition'] = ammunition;
    data['name'] = name;
    data['type'] = type;
    data['damage'] = damage;
    data['cost'] = cost;
    data['weight'] = weight;
    data['features'] = features;
    data['info'] = info;
    return data;
  }

  //TODO
  @override
  String toString() {
    return "instance of Weapon";
  }
}
