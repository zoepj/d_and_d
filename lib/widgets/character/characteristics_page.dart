import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:flutter/material.dart';

import '../side_drawer.dart';
import 'character_main_page.dart';

class CharacteristicsPage extends StatefulWidget {
  const CharacteristicsPage({Key? key, required this.character})
      : super(key: key);
  final Character character;

  @override
  _CharacteristicsPageState createState() => _CharacteristicsPageState();
}

class _CharacteristicsPageState extends State<CharacteristicsPage> {
  bool _expanded1 = false;
  bool _expanded2 = false;
  bool _modifying = false;

  final _formKey = GlobalKey<FormState>();

  final _intTextStyle = const TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 17,
  );

  final _characteristicsTextStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    fontSize: 13,
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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
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
                            DB.updateCharacter(widget.character);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CharacterMainPage(
                                          initialIndex: 2,
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
                        },
                      );
                    },
                  ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      _modifying
                          ? SizedBox(
                              width: 34,
                              child: TextFormField(
                                initialValue: widget
                                    .character.characteristics!.strength
                                    .toString(),
                                keyboardType: TextInputType.number,
                                validator: (enteredValue) {
                                  if (enteredValue != null &&
                                      enteredValue.isNotEmpty) {
                                    widget.character.characteristics!.strength =
                                        int.parse(enteredValue);
                                    return null;
                                  }
                                },
                                style: _textStyle,
                                decoration: _formDecorationInt,
                              ),
                            )
                          : Text(
                              "${widget.character.characteristics!.strength}",
                              style: _intTextStyle,
                            ),
                      Text(
                        "STRENGTH",
                        textAlign: TextAlign.center,
                        style: _characteristicsTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      _modifying
                          ? SizedBox(
                              width: 34,
                              child: TextFormField(
                                initialValue: widget
                                    .character.characteristics!.dexterity
                                    .toString(),
                                keyboardType: TextInputType.number,
                                validator: (enteredValue) {
                                  if (enteredValue != null &&
                                      enteredValue.isNotEmpty) {
                                    widget.character.characteristics!
                                        .dexterity = int.parse(enteredValue);
                                    return null;
                                  }
                                },
                                style: _textStyle,
                                decoration: _formDecorationInt,
                              ),
                            )
                          : Text(
                              "${widget.character.characteristics!.dexterity}",
                              style: _intTextStyle,
                            ),
                      Text(
                        "DEXTERITY",
                        textAlign: TextAlign.center,
                        style: _characteristicsTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      _modifying
                          ? SizedBox(
                              width: 34,
                              child: TextFormField(
                                initialValue: widget
                                    .character.characteristics!.constitution
                                    .toString(),
                                keyboardType: TextInputType.number,
                                validator: (enteredValue) {
                                  if (enteredValue != null &&
                                      enteredValue.isNotEmpty) {
                                    widget.character.characteristics!
                                        .constitution = int.parse(enteredValue);
                                    return null;
                                  }
                                },
                                style: _textStyle,
                                decoration: _formDecorationInt,
                              ),
                            )
                          : Text(
                              "${widget.character.characteristics!.constitution}",
                              style: _intTextStyle,
                            ),
                      Text(
                        "CONSTITUTION",
                        textAlign: TextAlign.center,
                        style: _characteristicsTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      _modifying
                          ? SizedBox(
                              width: 34,
                              child: TextFormField(
                                initialValue: widget
                                    .character.characteristics!.wisdom
                                    .toString(),
                                keyboardType: TextInputType.number,
                                validator: (enteredValue) {
                                  if (enteredValue != null &&
                                      enteredValue.isNotEmpty) {
                                    widget.character.characteristics!.wisdom =
                                        int.parse(enteredValue);
                                    return null;
                                  }
                                },
                                style: _textStyle,
                                decoration: _formDecorationInt,
                              ),
                            )
                          : Text(
                              "${widget.character.characteristics!.wisdom}",
                              style: _intTextStyle,
                            ),
                      Text(
                        "WISDOM",
                        textAlign: TextAlign.center,
                        style: _characteristicsTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      _modifying
                          ? SizedBox(
                              width: 34,
                              child: TextFormField(
                                initialValue: widget
                                    .character.characteristics!.intelligence
                                    .toString(),
                                keyboardType: TextInputType.number,
                                validator: (enteredValue) {
                                  if (enteredValue != null &&
                                      enteredValue.isNotEmpty) {
                                    widget.character.characteristics!
                                        .intelligence = int.parse(enteredValue);
                                    return null;
                                  }
                                },
                                style: _textStyle,
                                decoration: _formDecorationInt,
                              ),
                            )
                          : Text(
                              "${widget.character.characteristics!.intelligence}",
                              style: _intTextStyle,
                            ),
                      Text(
                        "INTELLIGENCE",
                        textAlign: TextAlign.center,
                        style: _characteristicsTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      _modifying
                          ? SizedBox(
                              width: 34,
                              child: TextFormField(
                                initialValue: widget
                                    .character.characteristics!.charisma
                                    .toString(),
                                keyboardType: TextInputType.number,
                                validator: (enteredValue) {
                                  if (enteredValue != null &&
                                      enteredValue.isNotEmpty) {
                                    widget.character.characteristics!.charisma =
                                        int.parse(enteredValue);
                                    return null;
                                  }
                                },
                                style: _textStyle,
                                decoration: _formDecorationInt,
                              ),
                            )
                          : Text(
                              "${widget.character.characteristics!.charisma}",
                              style: _intTextStyle,
                            ),
                      Text(
                        "CHARISMA",
                        textAlign: TextAlign.center,
                        style: _characteristicsTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              ExpansionPanelList(
                animationDuration: const Duration(milliseconds: 500),
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          "SAVING THROWS:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Strength: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.savingThrows!.strength
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.savingThrows!
                                                    .strength =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.savingThrows!.strength}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Dexterity: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.savingThrows!.dexterity
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.savingThrows!
                                                    .dexterity =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.savingThrows!.dexterity}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Constitution: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget.character
                                            .savingThrows!.constitution
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.savingThrows!
                                                    .constitution =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.savingThrows!.constitution}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Wisdom: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.savingThrows!.wisdom
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.savingThrows!
                                                    .wisdom =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.savingThrows!.wisdom}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Intelligence: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget.character
                                            .savingThrows!.intelligence
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.savingThrows!
                                                    .intelligence =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.savingThrows!.intelligence}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Charisma: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.savingThrows!.charisma
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.savingThrows!
                                                    .charisma =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.savingThrows!.charisma}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isExpanded: _expanded1,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'SKILLS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Wrap(
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Athletics: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.athletics
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!.athletics =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.athletics}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Acrobatics: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.acrobatics
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!
                                                    .acrobatics =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.acrobatics}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Sleight of hand: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.sleightOfHand
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!
                                                    .sleightOfHand =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.sleightOfHand}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Stealth: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.stealth
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!.stealth =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.stealth}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Arcana: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.arcana
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!.arcana =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.arcana}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "History: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.history
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!.history =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.history}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Investigation: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.investigation
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!
                                                    .investigation =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.investigation}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Nature: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.nature
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!.nature =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.nature}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Religion: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.religion
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!.religion =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.religion}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Animal handling: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.animalHandling
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!
                                                    .animalHandling =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.animalHandling}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Insight: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.insight
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!.insight =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.insight}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Medicine: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.medicine
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!.medicine =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.medicine}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Perception: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.savingThrows!.charisma
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!
                                                    .perception =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.perception}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Survival: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.survival
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!.survival =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.survival}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Deception: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.deception
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!.deception =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.deception}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Intimidation: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.intimidation
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!
                                                    .intimidation =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.intimidation}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Performance: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.performance
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!
                                                    .performance =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.performance}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Persuasion: ",
                                style: _textStyle,
                              ),
                              _modifying
                                  ? SizedBox(
                                      width: 34,
                                      child: TextFormField(
                                        initialValue: widget
                                            .character.skills!.persuasion
                                            .toString(),
                                        keyboardType: TextInputType.number,
                                        validator: (enteredValue) {
                                          if (enteredValue != null &&
                                              enteredValue.isNotEmpty) {
                                            widget.character.skills!
                                                    .persuasion =
                                                int.parse(enteredValue);
                                            return null;
                                          }
                                        },
                                        style: _textStyle,
                                        decoration: _formDecorationInt,
                                      ),
                                    )
                                  : Text(
                                      "${widget.character.skills!.persuasion}",
                                      style: _textStyle,
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isExpanded: _expanded2,
                    canTapOnHeader: true,
                  ),
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  if (panelIndex == 0) {
                    _expanded1 = !isExpanded;
                  } else {
                    _expanded2 = !isExpanded;
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
