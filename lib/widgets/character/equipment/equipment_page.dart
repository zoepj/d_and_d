import 'package:d_and_d/models/armor.dart';
import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/weapon.dart';
import 'package:d_and_d/widgets/equipment/object_widget.dart';
import 'package:d_and_d/widgets/equipment/weapon_widget.dart';
import 'package:flutter/material.dart';

import 'armor_widget.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({Key? key, required this.character}) : super(key: key);
  final Character character;

  @override
  _EquipmentPageState createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  bool _expanded1 = false;
  bool _expanded2 = false;
  bool _expanded3 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionPanelList(
            animationDuration: const Duration(milliseconds: 1500),
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, isExpanded) {
                  return const ListTile(
                    title: Text(
                      "ARMORS:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  );
                },
                body: Column(
                  children: [
                    for (Armor a in widget.character.armors)
                      TextButton(
                        child: Text(a.name.toUpperCase()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArmorWidget(
                                armor: a,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
                isExpanded: _expanded1,
                canTapOnHeader: true,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, isExpanded) {
                  return const ListTile(
                    title: Text(
                      'WEAPONS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  );
                },
                body: Column(children: [
                  for (Weapon w in widget.character.weapons)
                    TextButton(
                      child: Text(w.name.toUpperCase()),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeaponWidget(
                              weapon: w,
                            ),
                          ),
                        );
                      },
                    ),
                ]),
                isExpanded: _expanded2,
                canTapOnHeader: true,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, isExpanded) {
                  return const ListTile(
                    title: Text(
                      'OBJECTS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  );
                },
                body: Column(children: [
                  for (MyObject o in widget.character.objects)
                    TextButton(
                      child: Text(o.name.toUpperCase()),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyObjectWidget(
                              myObject: o,
                            ),
                          ),
                        );
                      },
                    ),
                ]),
                isExpanded: _expanded3,
                canTapOnHeader: true,
              ),
            ],
            dividerColor: Colors.grey,
            expansionCallback: (panelIndex, isExpanded) {
              if (panelIndex == 0) {
                _expanded1 = !isExpanded;
              } else if (panelIndex == 1) {
                _expanded2 = !isExpanded;
              } else if (panelIndex == 2) {
                _expanded3 = !isExpanded;
              }
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
