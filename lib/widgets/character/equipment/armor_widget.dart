import 'package:d_and_d/models/armor.dart';
import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';

class ArmorWidget extends StatefulWidget {
  const ArmorWidget({Key? key, required this.armor, required this.character})
      : super(key: key);
  final Armor armor;
  final Character character;

  @override
  State<ArmorWidget> createState() => _ArmorWidgetState();
}

class _ArmorWidgetState extends State<ArmorWidget> {
  bool _modifying = false;

  final _formKey = GlobalKey<FormState>();

  final _nameTextStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  final _textStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );
  final InputDecoration _formDecoration = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          drawer: const SideDrawer(),
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
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
                              DB.updateArmor(widget.armor, widget.character);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ArmorWidget(
                                      character: widget.character,
                                      armor: widget.armor,
                                    ),
                                  ),
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
                Row(
                  children: [
                    _modifying
                        ? SizedBox(
                            width: 250,
                            child: TextFormField(
                              initialValue:
                                  widget.armor.name.toString().toUpperCase(),
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.armor.name = enteredValue;
                                  return null;
                                }
                              },
                              style: _nameTextStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.armor.name.toUpperCase(),
                            style: _nameTextStyle,
                          )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "ARMOR CLASS: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 20,
                            child: TextFormField(
                              initialValue: widget.armor.armorClass.toString(),
                              keyboardType: TextInputType.number,
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.armor.armorClass =
                                      int.parse(enteredValue);
                                  return null;
                                }
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            "${widget.armor.armorClass}",
                            style: _textStyle,
                          ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "TYPE: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 150,
                            child: TextFormField(
                              initialValue: widget.armor.type,
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.armor.type = enteredValue;
                                  return null;
                                }
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.armor.type,
                            style: _textStyle,
                          ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "CHARACTERISTICS: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 150,
                            child: TextFormField(
                              initialValue: widget.armor.characteristic,
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.armor.characteristic = enteredValue;
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.armor.characteristic,
                            style: _textStyle,
                          ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "COST: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 150,
                            child: TextFormField(
                              initialValue: widget.armor.cost,
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.armor.cost = enteredValue;
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.armor.cost,
                            style: _textStyle,
                          ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "INFORMATION: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 150,
                            child: TextFormField(
                              initialValue: widget.armor.info,
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.armor.info = enteredValue;
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.armor.info,
                            style: _textStyle,
                          ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "STRENGTH: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 20,
                            child: TextFormField(
                              initialValue: widget.armor.strength.toString(),
                              keyboardType: TextInputType.number,
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.armor.strength =
                                      int.parse(enteredValue);
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            "${widget.armor.strength}",
                            style: _textStyle,
                          ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "STEALTH: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 150,
                            child: TextFormField(
                              initialValue: widget.armor.stealth.toString(),
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.armor.stealth = enteredValue == 'true';
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            "${widget.armor.stealth}",
                            style: _textStyle,
                          ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "WEIGHT: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 150,
                            child: TextFormField(
                              initialValue: widget.armor.weight,
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.armor.weight = enteredValue;
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.armor.weight,
                            style: _textStyle,
                          ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
