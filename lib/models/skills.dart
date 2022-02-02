class Skills {
  int athletics;
  int acrobatics;
  int sleightOfHand;
  int stealth;
  int arcana;
  int history;
  int investigation;
  int nature;
  int religion;
  int animalHandling;
  int insight;
  int medicine;
  int perception;
  int survival;
  int deception;
  int intimidation;
  int performance;
  int persuasion;

  Skills(
      {this.athletics = 0,
      this.acrobatics = 0,
      this.sleightOfHand = 0,
      this.stealth = 0,
      this.arcana = 0,
      this.history = 0,
      this.investigation = 0,
      this.nature = 0,
      this.religion = 0,
      this.animalHandling = 0,
      this.insight = 0,
      this.medicine = 0,
      this.perception = 0,
      this.survival = 0,
      this.deception = 0,
      this.intimidation = 0,
      this.performance = 0,
      this.persuasion = 0});

  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      athletics: int.parse(json['athletics']),
      acrobatics: int.parse(json['acrobatics']),
      sleightOfHand: int.parse(json['sleightOfHand']),
      stealth: int.parse(json['stealth']),
      arcana: int.parse(json['arcana']),
      history: int.parse(json['history']),
      investigation: int.parse(json['investigation']),
      nature: int.parse(json['nature']),
      religion: int.parse(json['religion']),
      animalHandling: int.parse(json['animalHandling']),
      insight: int.parse(json['insight']),
      medicine: int.parse(json['medicine']),
      perception: int.parse(json['perception']),
      survival: int.parse(json['survival']),
      deception: int.parse(json['deception']),
      intimidation: int.parse(json['intimidation']),
      performance: int.parse(json['performance']),
      persuasion: int.parse(json['persuasion']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['athletics'] = athletics;
    data['acrobatics'] = acrobatics;
    data['sleightOfHand'] = sleightOfHand;
    data['stealth'] = stealth;
    data['arcana'] = arcana;
    data['history'] = history;
    data['investigation'] = investigation;
    data['nature'] = nature;
    data['religion'] = religion;
    data['animalHandling'] = animalHandling;
    data['insight'] = insight;
    data['medicine'] = medicine;
    data['perception'] = perception;
    data['survival'] = survival;
    data['deception'] = deception;
    data['intimidation'] = intimidation;
    data['performance'] = performance;
    data['persuasion'] = persuasion;
    return data;
  }

  @override
  String toString() {
    return '{"athletics": "' +
        athletics.toString() +
        '", "acrobatics": "' +
        acrobatics.toString() +
        '", "sleightOfHand": "' +
        sleightOfHand.toString() +
        '", "stealth": "' +
        stealth.toString() +
        '", "arcana": "' +
        arcana.toString() +
        '", "history": "' +
        history.toString() +
        '", "investigation": "' +
        investigation.toString() +
        '", "nature": "' +
        nature.toString() +
        '", "religion": "' +
        religion.toString() +
        '", "animalHandling": "' +
        animalHandling.toString() +
        '", "insight": "' +
        insight.toString() +
        '", "medicine": "' +
        medicine.toString() +
        '", "perception": "' +
        perception.toString() +
        '", "survival": "' +
        survival.toString() +
        '", "deception": "' +
        deception.toString() +
        '", "intimidation": "' +
        intimidation.toString() +
        '", "performance": "' +
        performance.toString() +
        '", "persuasion": "' +
        persuasion.toString() +
        '"}';
  }
}
