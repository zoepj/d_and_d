import 'package:d_and_d/models/damage_type.dart';
import 'package:d_and_d/models/school.dart';
import 'package:enum_to_string/enum_to_string.dart';

class Spell {
  int level;
  String name;
  DamageType? damageType;
  School? school;
  String? castingTime;
  String? range;
  String? components;
  String? duration;
  String? description;

  Spell(
      {required this.level,
      required this.name,
      this.damageType = DamageType.acid,
      this.school = School.abjuration,
      this.castingTime = "",
      this.range = "",
      this.components = "",
      this.duration = "",
      this.description = ""});

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
        name: json['name'],
        level: json['level'],
        damageType:
            EnumToString.fromString(DamageType.values, json['damageType']),
        school: EnumToString.fromString(School.values, json['school']),
        castingTime: json['castingTime'],
        range: json['range'],
        components: json['components'],
        duration: json['duration'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['name'] = name;
    data['damageType'] = damageType;
    data['school'] = school;
    data['castingTime'] = castingTime;
    data['range'] = range;
    data['components'] = components;
    data['duration'] = duration;
    data['description'] = description;
    return data;
  }

  @override
  String toString() {
    return '{"level": "' +
        level.toString() +
        '", "name": "' +
        name +
        '", "damageType": "' +
        damageType.toString() +
        '", "school": "' +
        school.toString() +
        '", "castingTime": "' +
        castingTime! +
        '", "range": "' +
        range! +
        '", "components": "' +
        components! +
        '", "duration": "' +
        duration! +
        '", "description": "' +
        description! +
        '"}';
  }
}
