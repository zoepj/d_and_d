class Characteristics {
  int strength;
  int dexterity;
  int constitution;
  int intelligence;
  int wisdom;
  int charisma;

  Characteristics({
    this.strength = 0,
    this.dexterity = 0,
    this.constitution = 0,
    this.intelligence = 0,
    this.wisdom = 0,
    this.charisma = 0,
  });

  factory Characteristics.fromJson(Map<String, dynamic> json) {
    return Characteristics(
      strength: int.parse(json['strength']),
      dexterity: int.parse(json['dexterity']),
      constitution: int.parse(json['constitution']),
      intelligence: int.parse(json['intelligence']),
      wisdom: int.parse(json['wisdom']),
      charisma: int.parse(json['charisma']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strength'] = strength;
    data['dexterity'] = dexterity;
    data['constitution'] = constitution;
    data['intelligence'] = intelligence;
    data['wisdom'] = wisdom;
    data['charisma'] = charisma;
    return data;
  }

  @override
  String toString() {
    return '{"strength": "' +
        strength.toString() +
        '", "dexterity": "' +
        dexterity.toString() +
        '", "constitution": "' +
        constitution.toString() +
        '", "intelligence": "' +
        intelligence.toString() +
        '", "wisdom": "' +
        wisdom.toString() +
        '", "charisma": "' +
        charisma.toString() +
        '"}';
  }
}
