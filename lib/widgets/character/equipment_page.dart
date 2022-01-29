import 'package:d_and_d/models/armor.dart';
import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/weapon.dart';
import 'package:d_and_d/widgets/character/object_page.dart';
import 'package:d_and_d/widgets/character/weapon_page.dart';
import 'package:flutter/material.dart';

import 'armor_page.dart';

class EquipmentPage extends StatelessWidget {
  const EquipmentPage({Key? key, required this.character}) : super(key: key);
  final Character character;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("ARMORS:"),
          for(Armor a in character.armors)
            TextButton(
              child: Center(child: Text(a.name)),
              onPressed: () {
                Navigator.push( context,
                  MaterialPageRoute(
                    builder: (context) => ArmorPage(
                      armor: a,
                    ),
                  ),
                );
              },
            ),
          const Text(""),
          const Text("WEAPONS:"),
          for(Weapon w in character.weapons)
            TextButton(
              child: Center(child: Text(w.name)),
              onPressed: () {
                Navigator.push( context,
                  MaterialPageRoute(
                    builder: (context) => WeaponPage(
                      weapon: w,
                    ),
                  ),
                );
              },
            ),
          const Text(""),
          const Text("OBJECTS:"),
          for(MyObject o in character.objects)
            TextButton(
              child: Center(child: Text(o.name)),
              onPressed: () {
                Navigator.push( context,
                  MaterialPageRoute(
                    builder: (context) => MyObjectPage(
                      myObject: o,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
