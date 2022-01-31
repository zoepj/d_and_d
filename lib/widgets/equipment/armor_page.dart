import 'package:d_and_d/models/armor.dart';
import 'package:flutter/material.dart';

import '../side_drawer.dart';

class ArmorPage extends StatelessWidget {
  const ArmorPage({Key? key, required this.armor}) : super(key: key);
  final Armor armor;
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
            Text(armor.name.toUpperCase(),
                style: const TextStyle(height: 1.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          Text("\nARMOR CLASS: ${armor.armorClass}",
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
          Text("TYPE: " + armor.type,
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
          Text("CHARACTERISTICS: ${armor.characteristic}",
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
          Text("COST: ${armor.cost}",
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
          Text("EQUIPPED: ${armor.equipped}",
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
          Text("INFORMATION: ${armor.info}",
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
          Text("STRENGTH: ${armor.strength}",
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
          Text("STEALTH: ${armor.stealth}",
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
          Text("WEIGHT: ${armor.weight}",
              style: const TextStyle(height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 17)),
          ],
        ),
      )
    );
  }
}
