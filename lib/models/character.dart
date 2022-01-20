import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/weapon.dart';

import 'armor.dart';

/// Made using https://jsontodart.com/
/// example used is in d_and_d/JSON_examples

class Character {
  String name;
  String imagePath;
  int level;
  int armor;
  int initiative;
  int speed;
  int currentHitPoints;
  int temporaryHitPoints;
  String race;
  String characterClass;
  String background;
  List<Armor> armors;
  List<dynamic> weapons;
  List<dynamic> objects;
  bool favorite;

  Character({
    required this.name,
    this.imagePath = "",
    this.level = 0,
    this.armor = 0,
    this.initiative = 0,
    this.speed = 0,
    this.currentHitPoints = 0,
    this.temporaryHitPoints = 0,
    this.race = "",
    this.characterClass = "",
    this.background = "",
    required this.armors,
    required this.weapons,
    required this.objects,
    this.favorite = false,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    final armors = json['armors'];
    List<Map<String, Object>> armorsListMap =
        List<Map<String, Object>>.from(armors);
    List<Armor> armorsList = List.empty(growable: true);
    for (int i = 0; i < armorsListMap.length; i++) {
      armorsList.add(Armor.fromJson(armorsListMap[i]));
    }

    final weapons = json['weapons'];
    List<Map<String, Object>> weaponsListMap =
        List<Map<String, Object>>.from(weapons);
    List<Weapon> weaponsList = List.empty(growable: true);
    for (int i = 0; i < weaponsListMap.length; i++) {
      weaponsList.add(Weapon.fromJson(weaponsListMap[i]));
    }

    final object = json['objects'];
    List<Map<String, Object>> objectsListMap =
        List<Map<String, Object>>.from(object);
    List<MyObject> objectsList = List.empty(growable: true);
    for (int i = 0; i < objectsListMap.length; i++) {
      objectsList.add(MyObject.fromJson(objectsListMap[i]));
    }

    return Character(
      name: json['name'],
      imagePath: json['imagePath'],
      level: json['level'],
      armor: json['armor'],
      initiative: json['initiative'],
      speed: json['speed'],
      currentHitPoints: json['currentHitPoints'],
      temporaryHitPoints: json['temporaryHitPoints'],
      race: json['race'],
      characterClass: json['characterClass'],
      background: json['background'],
      armors: armorsList,
      weapons: weaponsList,
      objects: objectsList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imagePath'] = imagePath;
    data['level'] = level;
    data['armor'] = armor;
    data['initiative'] = initiative;
    data['speed'] = speed;
    data['currentHitPoints'] = currentHitPoints;
    data['temporaryHitPoints'] = temporaryHitPoints;
    data['race'] = race;
    data['characterClass'] = characterClass;
    data['background'] = background;
    data['armors'] = armors;
    data['weapons'] = weapons;
    data['objects'] = objects;
    return data;
  }
}
