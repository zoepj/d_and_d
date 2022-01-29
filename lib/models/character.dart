import 'package:d_and_d/models/characteristics_enum.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/saving_throws.dart';
import 'package:d_and_d/models/skills.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:d_and_d/models/weapon.dart';
import 'package:enum_to_string/enum_to_string.dart';

import 'armor.dart';
import 'characteristics.dart';

/// Made using https://jsontodart.com/
/// example used is in d_and_d/JSON_examples

class Character {
  String name;
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
  List<Armor> armors;
  List<dynamic> weapons;
  List<dynamic> objects;
  List<dynamic> spells;
  bool? favorite;
  Characteristics characteristics;
  SavingThrows savingThrows;
  Skills skills;
  int? spellSave;
  int? spellAttackBonus;
  CharacteristicsEnum? spellcastingAbility;

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
      required this.armors,
      required this.weapons,
      required this.objects,
      required this.spells,
      this.favorite = false,
      required this.characteristics,
      required this.savingThrows,
      required this.skills,
      this.spellSave = 0,
      this.spellAttackBonus = 0,
      this.spellcastingAbility = CharacteristicsEnum.intelligence});

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
      List<Map<String, Object>> spellsListMap =
          List<Map<String, Object>>.from(spell);
      for (int i = 0; i < spellsListMap.length; i++) {
        spellsList.add(Spell.fromJson(spellsListMap[i]));
      }
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
        spells: spellsList,
        characteristics: json['characteristics'] == null
            ? Characteristics()
            : Characteristics.fromJson(json['characteristics']),
        savingThrows: json['savingThrows'] == null
            ? SavingThrows()
            : SavingThrows.fromJson(json['savingThrows']),
        skills:
            json['skills'] == null ? Skills() : Skills.fromJson(json['skills']),
        spellSave: json['spellSave'],
        spellAttackBonus: json['spellAttackBonus'],
        spellcastingAbility: EnumToString.fromString(CharacteristicsEnum.values, json['spellcastingAbility'])
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
    data['spells'] = spells;
    data['characteristics'] = characteristics;
    data['savingThrows'] = savingThrows;
    data['skills'] = skills;
    data['spellSave'] = spellSave;
    data['spellAttackBonus'] = spellAttackBonus;
    data['spellcastingAbility'] = spellcastingAbility;
    return data;
  }
}
