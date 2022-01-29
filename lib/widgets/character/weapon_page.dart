import 'package:d_and_d/models/weapon.dart';
import 'package:flutter/material.dart';

import '../side_drawer.dart';

class WeaponPage extends StatelessWidget {
  const WeaponPage({Key? key, required this.weapon}) : super(key: key);
  final Weapon weapon;

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
          title: Text(weapon.name),
        ),


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ammunition: ${weapon.ammunition}"),
            Text("Type: " + weapon.type),
            Text("Damage: ${weapon.damage}"),
            Text("Cost: ${weapon.cost}"),
            Text("Weight: ${weapon.weight}"),
            Text("Features: ${weapon.features}"),
            Text("Info: ${weapon.info}"),
          ],
        ),
      )
    );
  }
}