import 'dart:convert';

import 'package:d_and_d/models/characteristics_enum.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/saving_throws.dart';
import 'package:d_and_d/models/skills.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:d_and_d/models/weapon.dart';

import 'armor.dart';
import 'characteristics.dart';

/// Made using https://jsontodart.com/
/// example used is in d_and_d/JSON_examples

class Character {
  String name;
  int id;
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
  String? alignment;
  String? looks;
  String? traits;
  String? ideals;
  String? bonds;
  String? flaws;
  String? languages;
  String? abilities;
  List<Armor> armors;
  List<dynamic> weapons;
  List<dynamic> objects;
  List<dynamic> spells;
  bool? favorite;
  Characteristics? characteristics;
  SavingThrows? savingThrows;
  Skills? skills;
  int? spellSave;
  int? spellAttackBonus;
  CharacteristicsEnum? spellcastingAbility;
  static int idCounter = 0;

  Character(
      {required this.name,
      required this.id,
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
      this.alignment = "NN",
      this.looks = "",
      this.traits = "",
      this.ideals = "",
      this.bonds = "",
      this.flaws = "",
      this.languages = "",
      this.abilities = "",
      required this.armors,
      required this.weapons,
      required this.objects,
      required this.spells,
      this.favorite = false,
      this.characteristics,
      this.savingThrows,
      this.skills,
      this.spellSave = 0,
      this.spellAttackBonus = 0,
      this.spellcastingAbility = CharacteristicsEnum.intelligence}) {
    characteristics = Characteristics();
    savingThrows = SavingThrows();
    skills = Skills();
  }

  factory Character.fromJson(Map<String, dynamic> jsonData) {
    List<Armor> armorsList = List.empty(growable: true);
    final armors = jsonData['armors'];
    if (armors != null) {
      List<Map<String, dynamic>> armorsListMap =
          List<Map<String, dynamic>>.from(armors);
      for (int i = 0; i < armorsListMap.length; i++) {
        armorsList.add(Armor.fromJson(armorsListMap[i]));
      }
    }

    List<Weapon> weaponsList = List.empty(growable: true);
    final weapons = jsonData['weapons'];
    if (weapons != null) {
      List<Map<String, Object>> weaponsListMap =
          List<Map<String, Object>>.from(weapons);
      for (int i = 0; i < weaponsListMap.length; i++) {
        weaponsList.add(Weapon.fromJson(weaponsListMap[i]));
      }
    }

    List<MyObject> objectsList = List.empty(growable: true);
    final object = jsonData['objects'];
    if (object != null) {
      List<Map<String, Object>> objectsListMap =
          List<Map<String, Object>>.from(object);
      for (int i = 0; i < objectsListMap.length; i++) {
        objectsList.add(MyObject.fromJson(objectsListMap[i]));
      }
    }

    List<Spell> spellsList = List.empty(growable: true);
    final spell = jsonData['spells'];
    if (spell != null) {
      List<Map<String, Object>> spellsListMap =
          List<Map<String, Object>>.from(spell);
      for (int i = 0; i < spellsListMap.length; i++) {
        spellsList.add(Spell.fromJson(spellsListMap[i]));
      }
    }

    return Character(
      name: jsonData['name'],
      id: int.parse(jsonData['id']),
      imagePath: jsonData['imagePath'] ?? "",
      level: int.parse(jsonData['level']),
      armor: int.parse(jsonData['armor']),
      initiative: int.parse(jsonData['initiative']),
      speed: int.parse(jsonData['speed']),
      currentHitPoints: int.parse(jsonData['currentHitPoints']),
      temporaryHitPoints: int.parse(jsonData['temporaryHitPoints']),
      race: jsonData['race'] ?? "",
      characterClass: jsonData['characterClass'] ?? "",
      background: jsonData['background'] ?? "",
      alignment: jsonData['alignment'] ?? "",
      looks: jsonData['looks'] ?? "",
      traits: jsonData['traits'] ?? "",
      ideals: jsonData['ideals'] ?? "",
      bonds: jsonData['bonds'] ?? "",
      flaws: jsonData['flaws'] ?? "",
      languages: jsonData['languages'] ?? "",
      abilities: jsonData['abilities'] ?? "",
      armors: armorsList,
      weapons: weaponsList,
      objects: objectsList,
      spells: spellsList,
      characteristics: jsonData['characteristics'] == null
          ? Characteristics.fromJson(json.decode(jsonData['characteristics']))
          : Characteristics(),
      savingThrows: jsonData['savingThrows'] == null
          ? SavingThrows.fromJson(json.decode(jsonData['savingThrows']))
          : SavingThrows(),
      skills: jsonData['skills'] == null
          ? Skills.fromJson(json.decode(jsonData['skills']))
          : Skills(),
      spellSave: int.parse(jsonData['spellSave']),
      spellAttackBonus: int.parse(jsonData['spellAttackBonus']),
      spellcastingAbility: jsonData['spellcastingAbility'] == null
          ? jsonData['spellcastingAbility']
          : CharacteristicsEnum.intelligence,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["id"] = id;
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
    data['alignment'] = alignment;
    data['looks'] = looks;
    data['traits'] = traits;
    data['ideals'] = ideals;
    data['bonds'] = bonds;
    data['flaws'] = flaws;
    data['languages'] = languages;
    data['abilities'] = abilities;
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
        '", "id": "' +
        id.toString() +
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
        '", "alignment": "' +
        alignment! +
        '", "looks": "' +
        looks! +
        '", "traits": "' +
        traits! +
        '", "ideals": "' +
        ideals! +
        '", "bonds": "' +
        bonds! +
        '", "flaws": "' +
        flaws! +
        '", "languages": "' +
        languages! +
        '", "abilities": "' +
        abilities! +
        '", "armors": ' +
        armors.toString() +
        ', "weapons": ' +
        weapons.toString() +
        ', "objects": ' +
        objects.toString() +
        ', "spells": ' +
        spells.toString() +
        ', "characteristics": ' +
        characteristics.toString() +
        ', "savingThrows": ' +
        savingThrows.toString() +
        ', "skills": ' +
        skills.toString() +
        ', "spellSave": "' +
        spellSave.toString() +
        '", "spellAttackBonus": "' +
        spellAttackBonus.toString() +
        '", "spellcastingAbility": "' +
        spellcastingAbility.toString() +
        '"}';
  }
}
