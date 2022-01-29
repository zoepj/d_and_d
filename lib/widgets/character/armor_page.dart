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
          title: Text(armor.name),
        ),


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Armor Class: ${armor.armorClass}"),
          Text("Type: " + armor.type),
          Text("Characteristic: ${armor.characteristic}"),
          Text("cost: ${armor.cost}"),
          Text("equipped: ${armor.equipped}"),
          Text("info: ${armor.info}"),
          Text("strength: ${armor.strength}"),
          Text("stealth: ${armor.stealth}"),
          Text("weight: ${armor.weight}"),
          ],
        ),
      )
    );
  }
}
