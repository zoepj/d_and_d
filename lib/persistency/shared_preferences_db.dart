import 'dart:convert';

import 'package:d_and_d/models/armor.dart';
import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:d_and_d/models/weapon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DB {
  static SharedPreferences? _preferences;
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void clear() {
    _preferences!.clear();
  }

  static List<Character> getCharacters() {
    List<String> list = _preferences!.getStringList("character_id_list") ?? [];
    List<Character> resList = List.empty(growable: true);
    for (int i = 0; i < list.length; i++) {
      String? characterString = _preferences!.getString(list[i]);
      if (characterString != null) {
        Map<String, dynamic> jsonData = json.decode(characterString);
        resList.add(Character.fromJson(jsonData));
      }
    }
    return resList;
  }

  static int getNewCharacterId() {
    int counter = _preferences!.getInt("character_counter") ?? 0;
    counter++;
    _preferences!.setInt("character_counter", counter);
    return counter;
  }

  static Future incrementCharacterCounter(int value) async {
    await _preferences!.setInt("character_counter", value);
  }

  static Future addCharacter(Character c) async {
    // add character with key being the id of the character and value being json data
    await _preferences!.setString(
      c.id.toString(),
      c.toString(),
    );
    // add
    List<String> list = _preferences!.getStringList("character_id_list") ?? [];
    if (list == []) {
      await _preferences!.setStringList("character_id_list", [c.id.toString()]);
    } else {
      list.add(c.id.toString());
      await _preferences!.setStringList("character_id_list", list);
    }
  }

  static Future updateCharacter(Character c) async {
    _preferences!.remove(c.id.toString());
    _preferences!.setString(
      c.id.toString(),
      c.toString(),
    );
  }

  static Future removeCharacter(Character c) async {
    await _preferences!.remove(c.id.toString());
    List<String> list = _preferences!.getStringList("character_id_list") ?? [];
    if (list != []) {
      list.remove(c.id.toString());
      _preferences!.setStringList("character_id_list", list);
    }
  }

  static int getNewArmorId() {
    int counter = _preferences!.getInt("armor_counter") ?? 0;
    counter++;
    _preferences!.setInt("armor_counter", counter);
    return counter;
  }

  static int getNewWeaponId() {
    int counter = _preferences!.getInt("weapon_counter") ?? 0;
    counter++;
    _preferences!.setInt("weapon_counter", counter);
    return counter;
  }

  static int getNewObjectId() {
    int counter = _preferences!.getInt("object_counter") ?? 0;
    counter++;
    _preferences!.setInt("object_counter", counter);
    return counter;
  }

  static int getNewSpellId() {
    int counter = _preferences!.getInt("spell_counter") ?? 0;
    counter++;
    _preferences!.setInt("spell_counter", counter);
    return counter;
  }

  static Future updateArmor(Armor a, Character c) async {
    String char = _preferences!.getString(c.id.toString()) ?? "null";
    int i = 0;
    int f = 0;
    if (char != "null") {
      Character inDB = Character.fromJson(json.decode(char));
      Armor oldArmor = inDB.armors
          .where(
            (e) => e.id == a.id,
          )
          .first;
      for (Armor ar in c.armors){
        if (ar.id == oldArmor.id){
          f = i;
        }
        i++;
      }
      c.armors.removeAt(f);
      c.armors.add(a);
      await updateCharacter(c);
    }
  }

  static Future updateWeapon(Weapon w, Character c) async{
    String char = _preferences!.getString(c.id.toString()) ?? "null";
    int i = 0;
    int f = 0;
    if (char != "null") {
      Character inDB = Character.fromJson(json.decode(char));
      Weapon oldWeapon = inDB.weapons
          .where(
            (e) => e.id == w.id,
          )
          .first;
      for (Weapon wp in c.weapons){
        if (wp.id == oldWeapon.id){
          f = i;
        }
        i++;
      }
      c.weapons.removeAt(f);
      c.weapons.add(w);
      await updateCharacter(c);
    }
  }

  static Future updateMyObject(MyObject o, Character c) async{
    String char = _preferences!.getString(c.id.toString()) ?? "null";
    int i = 0;
    int f = 0;
    if (char != "null") {
      Character inDB = Character.fromJson(json.decode(char));
      MyObject oldObject = inDB.objects
          .where(
            (e) => e.id == o.id,
          )
          .first;
      for (MyObject ob in c.objects){
        if (ob.id == oldObject.id){
          f = i;
        }
        i++;
      }
      c.objects.removeAt(f);

      c.objects.add(o);
      await updateCharacter(c);
    }
  }

  static Future removeArmor(Armor a, Character c) async {
    c.armors.remove(a);
    updateCharacter(c);
  }

  static Future removeWeapon(Weapon w, Character c) async {
    c.weapons.remove(w);
    updateCharacter(c);
  }

  static Future removeObject(MyObject o, Character c) async {
    c.objects.remove(o);
    updateCharacter(c);
  }

  static Future addSpell(Spell s, Character c) async {
    c.spells.add(s);
    updateCharacter(c);
  }

  static Future removeSpell(Spell s, Character c) async {
    c.spells.remove(s);
    updateCharacter(c);
  }
}
