import 'package:d_and_d/models/weapon.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';

class WeaponWidget extends StatelessWidget {
  const WeaponWidget({Key? key, required this.weapon}) : super(key: key);
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
          title: Text(""),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(weapon.name.toUpperCase(),
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.bold, fontSize: 20)),
              Text("\nAMMUNITION: ${weapon.ammunition}",
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 17)),
              Text("TYPE: " + weapon.type,
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 17)),
              Text("DAMAGE: ${weapon.damage}",
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 17)),
              Text("COST: ${weapon.cost}",
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 17)),
              Text("WEIGHT: ${weapon.weight}",
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 17)),
              Text("FEATURE: ${weapon.features}",
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 17)),
              Text("INFORMATION: ${weapon.info}",
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 17)),
            ],
          ),
        ));
  }
}
