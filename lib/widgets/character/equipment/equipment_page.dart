import 'package:d_and_d/models/armor.dart';
import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/models/weapon.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:d_and_d/widgets/character/equipment/weapon_widget.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';
import '../character_main_page.dart';
import 'armor_widget.dart';
import 'object_widget.dart';

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
  bool _modifying = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
          title: Text(widget.character.name),
          actions: [
            _modifying
                ? IconButton(
                    icon: const Icon(
                      Icons.check,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _modifying = false;
                          if (_formKey.currentState!.validate()) {
                            DB.updateCharacter(widget.character);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CharacterMainPage(
                                          initialIndex: 1,
                                          character: widget.character,
                                        )),
                                (Route<dynamic> route) => false);
                          }
                        },
                      );
                    },
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.edit,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _modifying = true;
                          _expanded1 = true;
                          _expanded2 = true;
                          _expanded3 = true;
                        },
                      );
                    },
                  ),
          ],
        ),
        body: SingleChildScrollView(
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
                          "ARMORS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                                    character: widget.character,
                                  ),
                                ),
                              );
                            },
                          ),
                        _modifying
                            ? Container(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  validator: (enteredValue) {
                                    if (enteredValue != null) {
                                      int i = DB.getNewArmorId();
                                      Armor a =
                                          Armor(name: enteredValue, id: i);
                                      widget.character.armors.add(a);
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    label: Center(
                                      child: Text(
                                        "+",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 23,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 1.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                ),
                              )
                            : const SizedBox(),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
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
                        _modifying
                            ? Container(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  validator: (enteredValue) {
                                    if (enteredValue != null) {
                                      int i = DB.getNewWeaponId();
                                      Weapon a =
                                          Weapon(name: enteredValue, id: i);
                                      widget.character.weapons.add(a);
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    label: Center(
                                      child: Text(
                                        "+",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 23,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 1.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    isExpanded: _expanded2,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'OBJECTS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
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
                        _modifying
                            ? Container(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  validator: (enteredValue) {
                                    if (enteredValue != null) {
                                      int i = DB.getNewObjectId();
                                      MyObject a =
                                          MyObject(name: enteredValue, id: i);
                                      widget.character.objects.add(a);
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    label: Center(
                                      child: Text(
                                        "+",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 23,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 1.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
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
        ),
      ),
    );
  }
}
