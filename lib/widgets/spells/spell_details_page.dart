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
          title: Text(""),
        ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(spell.name.toUpperCase(),
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            Text("\nLEVEL:  ${spell.level}",
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),),
            Text("DAMAGE TYPE: ${EnumToString.convertToString(spell.damageType)}", style: const TextStyle(height: 1.5,
                fontWeight: FontWeight.w400,
                fontSize: 17),),
            Text("SCHOOL OF MAGIC: ${EnumToString.convertToString(spell.school)}", style: const TextStyle(height: 1.5,
                fontWeight: FontWeight.w400,
                fontSize: 17),),
            Text("CASTING TIME: ${spell.castingTime}", style: const TextStyle(height: 1.5,
                fontWeight: FontWeight.w400,
                fontSize: 17),),
            Text("RANGE: ${spell.range}", style: const TextStyle(height: 1.5,
                fontWeight: FontWeight.w400,
                fontSize: 17),),
            Text("COMPONENTS: ${spell.components}", style: const TextStyle(height: 1.5,
                fontWeight: FontWeight.w400,
                fontSize: 17),),
            Text("DURATION: ${spell.duration}", style: const TextStyle(height: 1.5,
                fontWeight: FontWeight.w400,
                fontSize: 17),),
            Text("DESCRIPTION: ${spell.description}", style: const TextStyle(height: 1.5,
                fontWeight: FontWeight.w400,
                fontSize: 17),)
          ],
        ),
      )
    );
  }
}
