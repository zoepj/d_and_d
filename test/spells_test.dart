import 'package:d_and_d/main.dart';
import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Equipment', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({}); //set values here
    await DB.init();
    DB.clear();
    await tester.pumpWidget(const MyApp());

    Spell s = Spell(level: 0, name: "s", id: DB.getNewSpellId());
    Character c = Character(
        name: "c",
        id: DB.getNewCharacterId(),
        armors: [],
        weapons: [],
        objects: [],
        spells: []);
    DB.addCharacter(c);

    await DB.addSpell(s, c);
    expect(DB.getCharacters()[0].spells.length, 1);

    Spell s2 = Spell(level: 0, name: "s2", id: s.id);
    await DB.updateSpell(s2, c);
    expect(DB.getCharacters()[0].spells.length, 1);
    expect(DB.getCharacters()[0].spells[0].name, s2.name);

    await DB.removeSpell(s2, c);
    expect(DB.getCharacters()[0].spells.length, 0);
  });
}
