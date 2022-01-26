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
        athletics : json['athletics'],
        acrobatics : json['acrobatics'],
        sleightOfHand : json['sleightOfHand'],
        stealth : json['stealth'],
        arcana : json['arcana'],
        history : json['history'],
        investigation : json['investigation'],
        nature : json['nature'],
        religion : json['religion'],
        animalHandling : json['animalHandling'],
        insight : json['insight'],
        medicine : json['medicine'],
        perception : json['perception'],
        survival : json['survival'],
        deception : json['deception'],
        intimidation : json['intimidation'],
        performance : json['performance'],
        persuasion : json['persuasion']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['athletics'] = this.athletics;
    data['acrobatics'] = this.acrobatics;
    data['sleightOfHand'] = this.sleightOfHand;
    data['stealth'] = this.stealth;
    data['arcana'] = this.arcana;
    data['history'] = this.history;
    data['investigation'] = this.investigation;
    data['nature'] = this.nature;
    data['religion'] = this.religion;
    data['animalHandling'] = this.animalHandling;
    data['insight'] = this.insight;
    data['medicine'] = this.medicine;
    data['perception'] = this.perception;
    data['survival'] = this.survival;
    data['deception'] = this.deception;
    data['intimidation'] = this.intimidation;
    data['performance'] = this.performance;
    data['persuasion'] = this.persuasion;
    return data;
  }
}
