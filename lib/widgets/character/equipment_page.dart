import 'package:d_and_d/models/character.dart';
import 'package:flutter/material.dart';

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
          Text("ARMORS: ${character.armors.first.armorClass}"),
          Text("Type: " + character.armors.first.type),
          Text("Characteristic: ${character.armors.first.characteristic}"),
          Text("cost: ${character.armors.first.cost}"),
          Text("equipped: ${character.armors.first.equipped}"),
          Text("info: ${character.armors.first.info}"),
          Text("strength: ${character.armors.first.strength}"),
          Text("stealth: ${character.armors.first.stealth}"),
          Text("weight: ${character.armors.first.weight}"),
          const Text(""),
          const Text("WEAPONS:"),
          Text("Type: ${character.weapons.first.type}"),
          Text("ammunition: ${character.weapons.first.ammunition}"),
          Text("damage: ${character.weapons.first.damage}"),
          Text("cost: ${character.weapons.first.cost}"),
          Text("weight: ${character.weapons.first.weight}"),
          Text("features: ${character.weapons.first.features}"),
          Text("info: ${character.weapons.first.info}"),
        ],
      ),
    );
  }
}
