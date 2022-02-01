import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/weapon.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';

class WeaponWidget extends StatefulWidget {
  const WeaponWidget({Key? key, required this.weapon, required this.character})
      : super(key: key);
  final Weapon weapon;
  final Character character;

  @override
  State<WeaponWidget> createState() => _WeaponWidgetState();
}

class _WeaponWidgetState extends State<WeaponWidget> {
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
                              DB.updateWeapon(widget.weapon, widget.character);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WeaponWidget(
                                      character: widget.character,
                                      weapon: widget.weapon,
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
                _modifying
                    ? SizedBox(
                        width: 250,
                        child: TextFormField(
                          initialValue:
                              widget.weapon.name.toString().toUpperCase(),
                          validator: (enteredValue) {
                            if (enteredValue != null &&
                                enteredValue.isNotEmpty) {
                              widget.weapon.name = enteredValue;
                            }
                            return null;
                          },
                          style: _nameTextStyle,
                          decoration: _formDecoration,
                        ),
                      )
                    : Text(
                        widget.weapon.name.toUpperCase(),
                        style: _nameTextStyle,
                      ),
                Row(
                  children: [
                    Text(
                      "AMMUNITION: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 20,
                            child: TextFormField(
                              initialValue: widget.weapon.ammunition.toString(),
                              keyboardType: TextInputType.number,
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.weapon.ammunition =
                                      int.parse(enteredValue);
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            "${widget.weapon.ammunition}",
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
                              initialValue: widget.weapon.type.toString(),
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.weapon.type = enteredValue;
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.weapon.type,
                            style: _textStyle,
                          ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "DAMAGE: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 150,
                            child: TextFormField(
                              initialValue: widget.weapon.damage.toString(),
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.weapon.damage = enteredValue;
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.weapon.damage,
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
                              initialValue: widget.weapon.cost.toString(),
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.weapon.cost = enteredValue;
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.weapon.cost,
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
                              initialValue: widget.weapon.weight.toString(),
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.weapon.weight = enteredValue;
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.weapon.weight,
                            style: _textStyle,
                          ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "FEATURE: ",
                      style: _textStyle,
                    ),
                    _modifying
                        ? SizedBox(
                            width: 150,
                            child: TextFormField(
                              initialValue: widget.weapon.features.toString(),
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.weapon.features = enteredValue;
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.weapon.features,
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
                              initialValue: widget.weapon.info.toString(),
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.weapon.info = enteredValue;
                                }
                                return null;
                              },
                              style: _textStyle,
                              decoration: _formDecoration,
                            ),
                          )
                        : Text(
                            widget.weapon.info,
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
