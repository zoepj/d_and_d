import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/damage_type.dart';
import 'package:d_and_d/models/school.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:d_and_d/widgets/character/spells/spells_page.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';

class AddSpellPage extends StatefulWidget {
  const AddSpellPage({Key? key, required this.character}) : super(key: key);
  final Character character;

  @override
  _AddSpellPageState createState() => _AddSpellPageState();
}

final _formKey = GlobalKey<FormState>();

int getNewID() {
  int id = DB.getNewSpellId();
  return id;
}

class _AddSpellPageState extends State<AddSpellPage> {
  Spell s1 = Spell(name: '', level: -1, id: getNewID());

  final _textStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );
  final InputDecoration _formDecoration = const InputDecoration(
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
        title: const Text("Create a spell"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "NAME:  ",
                          style: _textStyle,
                        ),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            validator: (enteredValue) {
                              if (enteredValue == null ||
                                  enteredValue.isEmpty) {
                                return 'Enter name';
                              } else {
                                s1.name = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecoration,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "LEVEL:  ",
                          style: _textStyle,
                        ),
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (enteredValue) {
                              if (enteredValue == null ||
                                  enteredValue.isEmpty) {
                                return 'Enter Level';
                              } else if (int.parse(enteredValue) < 0 ||
                                  int.parse(enteredValue) > 9) {
                                return 'Level must be between 0 and 9';
                              } else {
                                s1.level = int.parse(enteredValue);
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecoration,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "DAMAGE TYPE: ",
                          style: _textStyle,
                        ),
                        DropdownButton<DamageType>(
                          value: s1.damageType,
                          onChanged: (newValue) {
                            setState(
                              () {
                                s1.damageType = newValue;
                              },
                            );
                          },
                          items: DamageType.values.map((DamageType classType) {
                            return DropdownMenuItem<DamageType>(
                              value: classType,
                              child: Text(getString(classType)),
                            );
                          }).toList(),
                        ),
                        /*
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                s1.damageType = enteredValue as DamageType?;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecoration,
                          ),
                        ),

                         */
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "SCHOOL OF MAGIC: ",
                          style: _textStyle,
                        ),
                        DropdownButton<School>(
                          value: s1.school,
                          onChanged: (newValue) {
                            setState(
                              () {
                                s1.school = newValue;
                              },
                            );
                          },
                          items: School.values.map((School classType) {
                            return DropdownMenuItem<School>(
                              value: classType,
                              child: Text(getSchoolString(classType)),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "CASTING TIME: ",
                          style: _textStyle,
                        ),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                s1.castingTime = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecoration,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "RANGE: ",
                          style: _textStyle,
                        ),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                s1.range = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecoration,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "COMPONENTS: ",
                          style: _textStyle,
                        ),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                s1.components = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecoration,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "DURATION: ",
                          style: _textStyle,
                        ),
                        SizedBox(
                          width: 150,
                          child: TextFormField(
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                s1.duration = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecoration,
                          ),
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
                        Flexible(
                          child: TextFormField(
                            maxLines: 5,
                            validator: (enteredValue) {
                              if (enteredValue != null &&
                                  enteredValue.isNotEmpty) {
                                s1.description = enteredValue;
                                return null;
                              }
                            },
                            style: _textStyle,
                            decoration: _formDecorationInt,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            DB.addSpell(s1, widget.character);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellsPage(
                                    character: widget.character,
                                  ),
                                ),
                                (Route<dynamic> route) => false);
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
