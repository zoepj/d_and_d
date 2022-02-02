import 'package:d_and_d/main.dart';
import 'package:d_and_d/models/armor.dart';
import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/weapon.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Character', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({}); //set values here
    await DB.init();
    DB.clear();
    await tester.pumpWidget(const MyApp());

    Armor a = Armor(name: "a", id: 1);
    Weapon w = Weapon(name: "w", id: 1);
    //MyObject o = MyObject(name: "o", id: 1);
    Character c = Character(name: "c", id: 1, armors: [a], weapons: [w], objects: [], spells: []);
    DB.addCharacter(c);

  });
}