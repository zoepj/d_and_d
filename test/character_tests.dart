// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:d_and_d/models/armor.dart';
import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:d_and_d/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {

  testWidgets('Character', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({}); //set values here
    await DB.init();
    DB.clear();
    await tester.pumpWidget(const MyApp());

    //test when the app starts there are no characters
    expect(DB.getCharacters().length, 0);

    //test adding a character
    int nCharacters = DB.getCharacters().length;
    Character c = Character(name: "c", id: DB.getNewCharacterId(), armors: [], weapons: [], objects: [], spells: []);
    await DB.addCharacter(c);
    expect(DB.getCharacters().length, nCharacters + 1);

    //test updating a character
    Character c2 = Character(name: "c2", id: c.id, armors: [], weapons: [], objects: [], spells: []);
    DB.updateCharacter(c2);
    expect(DB.getCharacters()[0].name, c2.name);

    //test adding adding to a character
    int nArmors = DB.getCharacters()[0].armors.length;
    Armor a = Armor(name: "a", id: DB.getNewArmorId());
    c2.armors.add(a);
    DB.updateCharacter(c2);
    expect(DB.getCharacters()[0].armors.length, nArmors + 1);

    //test deleting a character
    nCharacters = DB.getCharacters().length;
    await DB.removeCharacter(c);
    expect(DB.getCharacters().length, nCharacters - 1);
  });


}
