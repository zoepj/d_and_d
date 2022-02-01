import 'dart:convert';

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

  static Future setTest(bool value) async =>
      await _preferences!.setBool("key", value);

  static bool? getTest() => _preferences!.getBool("key");

  static List<Character> getCharacters() {
    List<String> list = _preferences!.getStringList("character_id_list") ?? [];
    List<Character> resList = List.empty(growable: true);
    for (int i = 0; i < list.length; i++) {
      String? characterString = _preferences!.getString(list[i]);
      if (characterString != null) {
        print("_____string: " + characterString);
        Map<String, dynamic> jsonData = json.decode(characterString);
        print("______map: " + jsonData.toString());
        resList.add(Character.fromJson(jsonData));
      }
    }
    return resList;
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
}
