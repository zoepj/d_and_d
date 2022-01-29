import 'package:d_and_d/models/armor.dart';
import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/weapon.dart';
import 'package:d_and_d/widgets/equipment/object_page.dart';
import 'package:d_and_d/widgets/equipment/weapon_page.dart';
import 'package:flutter/material.dart';

import 'armor_page.dart';

class EquipmentPage extends StatelessWidget {
  const EquipmentPage({Key? key, required this.character}) : super(key: key);
  final Character character;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("ARMORS:",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20),),
          for(Armor a in character.armors)
            TextButton(
              child: Text(a.name),
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
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          const Text("\nWEAPONS:",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20),),
          for(Weapon w in character.weapons)
            TextButton(
              child: Text(w.name),
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
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          const Text("\nOBJECTS:",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20),),
          for(MyObject o in character.objects)
            TextButton(
              child: Text(o.name),
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
