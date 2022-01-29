import 'package:d_and_d/models/characteristics_enum.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/saving_throws.dart';
import 'package:d_and_d/models/skills.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:d_and_d/models/weapon.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';

import 'armor.dart';
import 'characteristics.dart';

/// Made using https://jsontodart.com/
/// example used is in d_and_d/JSON_examples

class Character {
  String name;
  int? _id;
  String? imagePath;
  int? level;
  int? armor;
  int? initiative;
  int? speed;
  int? currentHitPoints;
  int? temporaryHitPoints;
  String? race;
  String? characterClass;
  String? background;
  List<dynamic>? armors;
  List<dynamic>? weapons;
  List<dynamic>? objects;
  List<dynamic>? spells;
  bool? favorite;
  Characteristics? characteristics;
  SavingThrows? savingThrows;
  Skills? skills;
  int? spellSave;
  int? spellAttackBonus;
  characteristicsEnum? spellcastingAbility;
  static int idCounter = 0;

  int? get id => _id;

  int _getNewID() {
    int id = idCounter++;
    DB.incrementCharacterCounter(id);
    return id;
  }

  Character(
      {required this.name,
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
      this.armors,
      this.weapons,
      this.objects,
      this.spells,
      this.favorite = false,
      this.characteristics,
      this.savingThrows,
      this.skills,
      this.spellSave = 0,
      this.spellAttackBonus = 0,
      this.spellcastingAbility = characteristicsEnum.intelligence}) {
    _id = _getNewID();
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    List<Armor> armorsList = List.empty(growable: true);
    final armors = json['armors'];
    if (armors != null) {
      List<Map<String, Object>> armorsListMap =
          List<Map<String, Object>>.from(armors);
      for (int i = 0; i < armorsListMap.length; i++) {
        armorsList.add(Armor.fromJson(armorsListMap[i]));
      }
    }

    List<Weapon> weaponsList = List.empty(growable: true);
    final weapons = json['weapons'];
    if (weapons != null) {
      List<Map<String, Object>> weaponsListMap =
          List<Map<String, Object>>.from(weapons);
      for (int i = 0; i < weaponsListMap.length; i++) {
        weaponsList.add(Weapon.fromJson(weaponsListMap[i]));
      }
    }

    List<MyObject> objectsList = List.empty(growable: true);
    final object = json['objects'];
    if (object != null) {
      List<Map<String, Object>> objectsListMap =
          List<Map<String, Object>>.from(object);
      for (int i = 0; i < objectsListMap.length; i++) {
        objectsList.add(MyObject.fromJson(objectsListMap[i]));
      }
    }

    List<Spell> spellsList = List.empty(growable: true);
    final spell = json['spells'];
    if (spell != null) {
      List<Map<String, Spell>> spellsListMap =
          List<Map<String, Spell>>.from(spell);
      for (int i = 0; i < spellsListMap.length; i++) {
        spellsList.add(Spell.fromJson(spellsListMap[i]));
      }
    }

    return Character(
      name: json['name'],
      imagePath: json['imagePath'] ?? "",
      level: int.parse(json['level']),
      armor: int.parse(json['armor']),
      initiative: int.parse(json['initiative']),
      speed: int.parse(json['speed']),
      currentHitPoints: int.parse(json['currentHitPoints']),
      temporaryHitPoints: int.parse(json['temporaryHitPoints']),
      race: json['race'] ?? "",
      characterClass: json['characterClass'] ?? "",
      background: json['background'] ?? "",
      armors: armorsList,
      weapons: weaponsList,
      objects: objectsList,
      spells: spellsList,
      /*
      characteristics: json['characteristics'] == null
          ? Characteristics()
          : Characteristics.fromJson(json['characteristics']),
      savingThrows: json['savingThrows'] == null
          ? SavingThrows()
          : SavingThrows.fromJson(json['savingThrows']),
      skills:
          json['skills'] == null ? Skills() : Skills.fromJson(json['skills']),
          */
      characteristics: Characteristics(),
      savingThrows: SavingThrows(),
      skills: Skills(),
      spellSave: int.parse(json['spellSave']),
      spellAttackBonus: int.parse(json['spellAttackBonus']),
      spellcastingAbility:
          characteristicsEnum.intelligence, //json['spellcastingAbility'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
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
    data['spells'] = spells;
    data['characteristics'] = characteristics;
    data['savingThrows'] = savingThrows;
    data['skills'] = skills;
    data['spellSave'] = spellSave;
    data['spellAttackBonus'] = spellAttackBonus;
    data['spellcastingAbility'] = spellcastingAbility;
    return data;
  }

  @override
  String toString() {
    return '{"name": "' +
        name +
        '", "imagePath": "' +
        imagePath! +
        '", "level": "' +
        level.toString() +
        '", "armor": "' +
        armor.toString() +
        '", "initiative": "' +
        initiative!.toString() +
        '", "speed": "' +
        speed.toString() +
        '", "currentHitPoints": "' +
        currentHitPoints.toString() +
        '", "temporaryHitPoints": "' +
        temporaryHitPoints.toString() +
        '", "race": "' +
        race! +
        '", "characterClass": "' +
        characterClass! +
        '", "background": "' +
        background! +
        '", "armors": ' +
        armors.toString() +
        ', "weapons": ' +
        weapons.toString() +
        ', "objects": ' +
        objects.toString() +
        ', "spells": ' +
        spells.toString() +
        ', "characteristics": "' +
        characteristics.toString() +
        '", "savingThrows": "' +
        savingThrows.toString() +
        '", "skills": "' +
        skills.toString() +
        '", "spellSave": "' +
        spellSave.toString() +
        '", "spellAttackBonus": "' +
        spellAttackBonus.toString() +
        '", "spellcastingAbility": "' +
        spellcastingAbility.toString() +
        '"}';
  }
}
