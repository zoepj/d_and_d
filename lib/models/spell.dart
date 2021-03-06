import 'package:d_and_d/models/damage_type.dart';
import 'package:d_and_d/models/school.dart';
import 'package:enum_to_string/enum_to_string.dart';

class Spell {
  int level;
  String name;
  int id;
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
      required this.id,
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
        level: int.parse(json['level']),
        id: int.parse(json['id']),
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
    data['id'] = id;
    data['damageType'] = EnumToString.convertToString(damageType);
    data['school'] = EnumToString.convertToString(school);
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
        '", "id": "' +
        id.toString() +
        '", "damageType": "' +
        EnumToString.convertToString(damageType)+
        '", "school": "' +
        EnumToString.convertToString(school) +
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
