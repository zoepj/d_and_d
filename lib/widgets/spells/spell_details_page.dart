import 'package:d_and_d/models/spell.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import '../side_drawer.dart';

class SpellDetailsPage extends StatelessWidget {
  const SpellDetailsPage({Key? key, required this.spell}) : super(key: key);
  final Spell spell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideDrawer(),
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          }),
          title: Text(spell.name),
        ),


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Level:  ${spell.level}"),
            Text("Damage Type: ${EnumToString.convertToString(spell.damageType)}"),
            Text("School of magic: ${EnumToString.convertToString(spell.school)}"),
            Text("Casting Time: ${spell.castingTime}"),
            Text("Range: ${spell.range}"),
            Text("Components: ${spell.components}"),
            Text("Duration: ${spell.duration}"),
            Text("Description: ${spell.description}")
          ],
        ),
      )
    );
  }
}
