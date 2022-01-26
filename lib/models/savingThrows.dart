class SavingThrows {
  int strength;
  int dexterity;
  int constitution;
  int intelligence;
  int wisdom;
  int charisma;

  SavingThrows(
      {this.strength = 0,
        this.dexterity = 0,
        this.constitution = 0,
        this.intelligence = 0,
        this.wisdom = 0,
        this.charisma = 0,});

  factory SavingThrows.fromJson(Map<String, dynamic> json) {
    return SavingThrows(
        strength : json['strength'],
        dexterity : json['dexterity'],
        constitution : json['constitution'],
        intelligence : json['intelligence'],
        wisdom : json['wisdom'],
        charisma : json['charisma']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strength'] = this.strength;
    data['dexterity'] = this.dexterity;
    data['constitution'] = this.constitution;
    data['intelligence'] = this.intelligence;
    data['wisdom'] = this.wisdom;
    data['charisma'] = this.charisma;
    return data;
  }
}
