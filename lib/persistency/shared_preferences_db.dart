import 'dart:convert';

import 'package:d_and_d/models/armor.dart';
import 'package:d_and_d/models/character.dart';
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
    int counter = _preferences!.getInt("character_counter") ?? -1;
    counter++;
    _preferences!.setInt("character_counter", counter);
    return counter;
  }

  static Future incrementCharacterCounter(int value) async {
    await _preferences!.setInt("character_counter", value);
  }

  static void addCharacter(Character c) {
    // add character with key being the id of the character and value being json data
    _preferences!.setString(
      c.id.toString(),
      c.toString(),
    );
    // add
    List<String> list = _preferences!.getStringList("character_id_list") ?? [];
    if (list == []) {
      _preferences!.setStringList("character_id_list", [c.id.toString()]);
    } else {
      list.add(c.id.toString());
      _preferences!.setStringList("character_id_list", list);
    }
  }

  static void updateCharacter(Character c) {
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
    int counter = _preferences!.getInt("armor_counter") ?? -1;
    counter++;
    _preferences!.setInt("armor_counter", counter);
    return counter;
  }

  static void updateArmor(Armor a, Character c) {
    String char = _preferences!.getString(c.id.toString()) ?? "null";
    if (char != "null") {
      Character inDB = Character.fromJson(json.decode(char));
      Armor oldArmor = inDB.armors
          .where(
            (e) => e.id == a.id,
          )
          .first;
      inDB.armors.remove(oldArmor);
      inDB.armors.add(a);
      updateCharacter(c);
    }
  }
}
