/// Made using https://jsontodart.com/
/// example used is in d_and_d/JSON_examples

class Character {
  String name;
  String imagePath;
  int level;
  int armor;
  int indicative;
  int speed;
  int currentHitPoints;
  int temporaryHitPoints;
  String race;
  String characterClass;
  String background;

  Character({
    required this.name,
    this.imagePath = "",
    this.level = 0,
    this.armor = 0,
    this.indicative = 0,
    this.speed = 0,
    this.currentHitPoints = 0,
    this.temporaryHitPoints = 0,
    this.race = "",
    this.characterClass = "",
    this.background = "",
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      imagePath: json['imagePath'],
      level: json['level'],
      armor: json['armor'],
      indicative: json['indicative'],
      speed: json['speed'],
      currentHitPoints: json['currentHitPoints'],
      temporaryHitPoints: json['temporaryHitPoints'],
      race: json['race'],
      characterClass: json['characterClass'],
      background: json['background'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imagePath'] = imagePath;
    data['level'] = level;
    data['armor'] = armor;
    data['indicative'] = indicative;
    data['speed'] = speed;
    data['currentHitPoints'] = currentHitPoints;
    data['temporaryHitPoints'] = temporaryHitPoints;
    data['race'] = race;
    data['characterClass'] = characterClass;
    data['background'] = background;
    return data;
  }
}
