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
        athletics: json['athletics'],
        acrobatics: json['acrobatics'],
        sleightOfHand: json['sleightOfHand'],
        stealth: json['stealth'],
        arcana: json['arcana'],
        history: json['history'],
        investigation: json['investigation'],
        nature: json['nature'],
        religion: json['religion'],
        animalHandling: json['animalHandling'],
        insight: json['insight'],
        medicine: json['medicine'],
        perception: json['perception'],
        survival: json['survival'],
        deception: json['deception'],
        intimidation: json['intimidation'],
        performance: json['performance'],
        persuasion: json['persuasion']);
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
    return "instance of Skills";
  }
}
