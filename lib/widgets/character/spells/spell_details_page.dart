import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/damage_type.dart';
import 'package:d_and_d/models/school.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';

class SpellDetailsPage extends StatefulWidget {
  const SpellDetailsPage(
      {Key? key, required this.spell, required this.character})
      : super(key: key);
  final Spell spell;
  final Character character;

  @override
  State<SpellDetailsPage> createState() => _SpellDetailsPageState();
}

class _SpellDetailsPageState extends State<SpellDetailsPage> {
  bool _modifying = false;
  final _formKey = GlobalKey<FormState>();

  final TextStyle _nameTextStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  final _textStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  final InputDecoration _formDecorationText = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
  );
  final InputDecoration _formDecorationInt = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
    border: OutlineInputBorder(),
  );

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
          title: Text(widget.character.name + "  -  Spell"),
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
                            DB.updateSpell(widget.spell, widget.character);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsPage(
                                    character: widget.character,
                                    spell: widget.spell,
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
              Text(
                widget.spell.name.toUpperCase(),
                style: _nameTextStyle,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "LEVEL:  ",
                    style: _textStyle,
                  ),
                  _modifying
                      ? SizedBox(
                          width: 170,
                          child: TextFormField(
                            initialValue: widget.spell.level.toString(),
                            keyboardType: TextInputType.number,
                            validator: (enteredValue) {
                              if (enteredValue == null ||
                                  enteredValue.isEmpty) {
                                return 'Enter Level';
                              } else if (int.parse(enteredValue) < 0 ||
                                  int.parse(enteredValue) > 9) {
                                return 'Level must be between 0 and 9';
                              } else {
                                widget.spell.level = int.parse(enteredValue);
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecorationText,
                          ),
                        )
                      : Text(
                          "${widget.spell.level}",
                          style: _textStyle,
                        ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "DAMAGE TYPE: ",
                    style: _textStyle,
                  ),
                  _modifying
                      ? DropdownButton<DamageType>(
                          value: widget.spell.damageType,
                          onChanged: (newValue) {
                            setState(
                              () {
                                widget.spell.damageType = newValue;
                              },
                            );
                          },
                          items: DamageType.values.map((DamageType classType) {
                            return DropdownMenuItem<DamageType>(
                              value: classType,
                              child: Text(getString(classType)),
                            );
                          }).toList(),
                        )
                      : Text(
                          widget.spell.damageType == null
                              ? ""
                              : EnumToString.convertToString(
                                  widget.spell.damageType),
                          style: _textStyle,
                        ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "SCHOOL OF MAGIC: ",
                    style: _textStyle,
                  ),
                  _modifying
                      ? DropdownButton<School>(
                          value: widget.spell.school,
                          onChanged: (newValue) {
                            setState(
                              () {
                                widget.spell.school = newValue;
                              },
                            );
                          },
                          items: School.values.map((School classType) {
                            return DropdownMenuItem<School>(
                              value: classType,
                              child: Text(getSchoolString(classType)),
                            );
                          }).toList(),
                        )
                      : Text(
                          widget.spell.damageType == null
                              ? ""
                              : EnumToString.convertToString(
                                  widget.spell.school),
                          style: _textStyle,
                        ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "CASTING TIME: ",
                    style: _textStyle,
                  ),
                  _modifying
                      ? SizedBox(
                          width: 150,
                          child: TextFormField(
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                widget.spell.castingTime = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecorationText,
                          ),
                        )
                      : Text(
                          "${widget.spell.castingTime}",
                          style: _textStyle,
                        ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "RANGE: ",
                    style: _textStyle,
                  ),
                  _modifying
                      ? SizedBox(
                          width: 150,
                          child: TextFormField(
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                widget.spell.range = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecorationText,
                          ),
                        )
                      : Text(
                          "${widget.spell.range}",
                          style: _textStyle,
                        ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "COMPONENTS: ",
                    style: _textStyle,
                  ),
                  _modifying
                      ? SizedBox(
                          width: 150,
                          child: TextFormField(
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                widget.spell.components = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecorationText,
                          ),
                        )
                      : Text(
                          "${widget.spell.components}",
                          style: _textStyle,
                        ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "DURATION: ",
                    style: _textStyle,
                  ),
                  _modifying
                      ? SizedBox(
                          width: 150,
                          child: TextFormField(
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                widget.spell.duration = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecorationText,
                          ),
                        )
                      : Text(
                          "${widget.spell.duration}",
                          style: _textStyle,
                        ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "DESCRIPTION: ",
                    style: _textStyle,
                  ),
                  _modifying
                      ? Flexible(
                          child: TextFormField(
                            maxLines: 5,
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                widget.spell.description = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecorationInt,
                          ),
                        )
                      : Flexible(
                        child: Text(
                            "${widget.spell.description}",
                            style: _textStyle,
                          ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
