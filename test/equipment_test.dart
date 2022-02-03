import 'package:d_and_d/models/armor.dart';
import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/weapon.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {

  group('Equipment tests', () {
    test('update armor equipment', () async {
      // Build our app and trigger a frame.
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({}); //set values here
      await DB.init();
      DB.clear();

      Armor a = Armor(name: "a", id: DB.getNewArmorId());
      Weapon w = Weapon(name: "w", id: DB.getNewWeaponId());
      MyObject o = MyObject(name: "o", id: DB.getNewObjectId());
      Character c = Character(
          name: "c",
          id: DB.getNewCharacterId(),
          armors: [a],
          weapons: [w],
          objects: [o],
          spells: []);
      DB.addCharacter(c);

      Armor a2 = Armor(name: "a2", id: a.id);
      await DB.updateArmor(a2, c);
      expect(DB.getCharacters()[0].armors.length, 1);
      expect(DB.getCharacters()[0].armors[0].name, a2.name);

    });


    test('update weapon equipment', () async {
      // Build our app and trigger a frame.
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({}); //set values here
      await DB.init();
      DB.clear();

      Armor a = Armor(name: "a", id: DB.getNewArmorId());
      Weapon w = Weapon(name: "w", id: DB.getNewWeaponId());
      MyObject o = MyObject(name: "o", id: DB.getNewObjectId());
      Character c = Character(
          name: "c",
          id: DB.getNewCharacterId(),
          armors: [a],
          weapons: [w],
          objects: [o],
          spells: []);
      DB.addCharacter(c);

      Weapon w2 = Weapon(name: "w2", id: w.id);
      await DB.updateWeapon(w2, c);
      expect(DB.getCharacters()[0].weapons.length, 1);
      expect(DB.getCharacters()[0].weapons[0].name, w2.name);

    });


    test('update object equipment', () async {
      // Build our app and trigger a frame.
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({}); //set values here
      await DB.init();
      DB.clear();

      Armor a = Armor(name: "a", id: DB.getNewArmorId());
      Weapon w = Weapon(name: "w", id: DB.getNewWeaponId());
      MyObject o = MyObject(name: "o", id: DB.getNewObjectId());
      Character c = Character(
          name: "c",
          id: DB.getNewCharacterId(),
          armors: [a],
          weapons: [w],
          objects: [o],
          spells: []);
      DB.addCharacter(c);


      MyObject o2 = MyObject(name: "o2", id: o.id);
      await DB.updateMyObject(o2, c);
      expect(DB.getCharacters()[0].objects.length, 1);
      expect(DB.getCharacters()[0].objects[0].name, o2.name);

    });

    test('remove armor equipment', () async {
      // Build our app and trigger a frame.
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({}); //set values here
      await DB.init();
      DB.clear();

      Armor a = Armor(name: "a", id: DB.getNewArmorId());
      Weapon w = Weapon(name: "w", id: DB.getNewWeaponId());
      MyObject o = MyObject(name: "o", id: DB.getNewObjectId());
      Character c = Character(
          name: "c",
          id: DB.getNewCharacterId(),
          armors: [a],
          weapons: [w],
          objects: [o],
          spells: []);
      DB.addCharacter(c);

      await DB.removeArmor(a, c);
      expect(DB.getCharacters()[0].armors.length, 0);

    });

    test('remove weapon equipment', () async {
      // Build our app and trigger a frame.
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({}); //set values here
      await DB.init();
      DB.clear();

      Armor a = Armor(name: "a", id: DB.getNewArmorId());
      Weapon w = Weapon(name: "w", id: DB.getNewWeaponId());
      MyObject o = MyObject(name: "o", id: DB.getNewObjectId());
      Character c = Character(
          name: "c",
          id: DB.getNewCharacterId(),
          armors: [a],
          weapons: [w],
          objects: [o],
          spells: []);
      DB.addCharacter(c);

      await DB.removeWeapon(w, c);
      expect(DB.getCharacters()[0].weapons.length, 0);

    });

    test('remove weapon equipment', () async {
      // Build our app and trigger a frame.
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({}); //set values here
      await DB.init();
      DB.clear();

      Armor a = Armor(name: "a", id: DB.getNewArmorId());
      Weapon w = Weapon(name: "w", id: DB.getNewWeaponId());
      MyObject o = MyObject(name: "o", id: DB.getNewObjectId());
      Character c = Character(
          name: "c",
          id: DB.getNewCharacterId(),
          armors: [a],
          weapons: [w],
          objects: [o],
          spells: []);
      DB.addCharacter(c);

      await DB.removeObject(o, c);
      expect(DB.getCharacters()[0].objects.length, 0);

    });
  });
}
