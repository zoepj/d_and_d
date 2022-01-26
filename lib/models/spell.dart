import 'package:d_and_d/models/damageType.dart';
import 'package:d_and_d/models/school.dart';

class Spell {
  int level;
  String name;
  DamageType damageType;
  School school;
  String castingTime;
  String range;
  String components;
  String duration;
  String description;

  Spell(
      {this.level = 0,
        required this.name,
        this.damageType = DamageType.ACID,
        this.school = School.ABJURATION,
        this.castingTime = "",
        this.range = "",
        this.components = "",
        this.duration = "",
        this.description = ""});

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
        name: json['name'],
        level: json['level'],
        damageType: json['damageType'],
        school: json['school'],
        castingTime: json['castingTime'],
        range: json['range'],
        components: json['components'],
        duration: json['duration'],
        description: json['description']
        );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['name'] = this.name;
    data['damageType'] = this.damageType;
    data['school'] = this.school;
    data['castingTime'] = this.castingTime;
    data['range'] = this.range;
    data['components'] = this.components;
    data['duration'] = this.duration;
    data['description'] = this.description;
    return data;
  }
}
