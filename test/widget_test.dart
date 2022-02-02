// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:d_and_d/widgets/dices/roll_page.dart';
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


    expect(DB.getCharacters().length, 0);


    int nCharacters = DB.getCharacters().length;
    Character c = Character(name: "c", id: 1, armors: [], weapons: [], objects: [], spells: []);
    await DB.addCharacter(c);
    expect(DB.getCharacters().length, nCharacters + 1);

    nCharacters = DB.getCharacters().length;
    await DB.removeCharacter(c);
    expect(DB.getCharacters().length, nCharacters - 1);
  });


}
