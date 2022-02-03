import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/characteristics_enum.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';
import 'add_spell_page.dart';
import 'spell_details_page.dart';

class SpellsPage extends StatefulWidget {
  const SpellsPage({Key? key, required this.character}) : super(key: key);
  final Character character;

  @override
  _SpellsPageState createState() => _SpellsPageState();
}

class _SpellsPageState extends State<SpellsPage> {
  bool _expanded0 = false;
  bool _expanded1 = false;
  bool _expanded2 = false;
  bool _expanded3 = false;
  bool _expanded4 = false;
  bool _expanded5 = false;
  bool _expanded6 = false;
  bool _expanded7 = false;
  bool _expanded8 = false;
  bool _expanded9 = false;
  bool _modifying = false;

  final _formKey = GlobalKey<FormState>();


  final _textStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  final InputDecoration _formDecorationInt = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
    border: OutlineInputBorder(),
  );


  void _showDeleteDialog(Object o) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to delete ' + (o as Spell).name),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                DB.removeSpell(o, widget.character);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SpellsPage(character: widget.character),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );
  }

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
          actions: [_modifying
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
                                builder: (context) => SpellsPage(
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
            IconButton(
              icon: const Icon(
                Icons.add,
              ),
              onPressed: () {
                setState(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddSpellPage(
                          character: widget.character,
                        ),
                      ),
                    );
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      _modifying
                          ? SizedBox(
                            width: 34,
                            child: TextFormField(
                              initialValue: widget
                                  .character.spellSave
                                  .toString(),
                              keyboardType: TextInputType.number,
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.character.spellSave =
                                      int.parse(enteredValue);
                                  return null;
                                }
                              },
                              style: _textStyle,
                              decoration: _formDecorationInt,
                            ),
                          )
                          : Text(
                            "${widget.character.spellSave}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 17),
                          ),
                      const Text(
                        "SPELL SAVE\nDC",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
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
                                  .character.spellAttackBonus
                                  .toString(),
                              keyboardType: TextInputType.number,
                              validator: (enteredValue) {
                                if (enteredValue != null &&
                                    enteredValue.isNotEmpty) {
                                  widget.character.spellAttackBonus =
                                      int.parse(enteredValue);
                                  return null;
                                }
                              },
                              style: _textStyle,
                              decoration: _formDecorationInt,
                            ),
                          )
                          : Text(
                            "${widget.character.spellAttackBonus}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 17),
                          ),
                      const Text(
                        "SPELL ATTACK\nBONUS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      _modifying
                          ? DropdownButton<CharacteristicsEnum>(
                        value: widget.character.spellcastingAbility,
                        onChanged: (newValue) {
                          setState(
                                () {
                              widget.character.spellcastingAbility = newValue;
                            },
                          );
                        },
                        items: CharacteristicsEnum.values.map((CharacteristicsEnum classType) {
                          return DropdownMenuItem<CharacteristicsEnum>(
                            value: classType,
                            child: Text(EnumToString.convertToString(classType)),
                          );
                        }).toList(),
                      )
                          : Text(
                            EnumToString.convertToString(
                                widget.character.spellcastingAbility)
                                .toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 17),
                      ),
                      const Text(
                        "SPELLCASTING\nABILITY",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
              const Text("\n"),
              ExpansionPanelList(
                animationDuration: const Duration(milliseconds: 500),
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          "CATNIP (Lv. 0):",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        for (Spell s in widget.character.spells)
                          if (s.level == 0) ...[
                            TextButton(
                              child: Text(s.name.toUpperCase()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpellDetailsPage(
                                      spell: s,
                                      character: widget.character,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    _showDeleteDialog(s);
                                  },
                                );
                              },
                            ),
                          ],
                      ],
                    ),
                    isExpanded: _expanded0,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'LEVEL 1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        for (Spell s in widget.character.spells)
                          if (s.level == 1) ...[
                            TextButton(
                              child: Text(s.name.toUpperCase()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpellDetailsPage(
                                      spell: s,
                                      character: widget.character,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    _showDeleteDialog(s);
                                  },
                                );
                              },
                            ),
                          ],
                      ],
                    ),
                    isExpanded: _expanded1,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'LEVEL 2',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        for (Spell s in widget.character.spells)
                          if (s.level == 2) ...[
                            TextButton(
                              child: Text(s.name.toUpperCase()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpellDetailsPage(
                                      spell: s,
                                      character: widget.character,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    _showDeleteDialog(s);
                                  },
                                );
                              },
                            ),
                          ],
                      ],
                    ),
                    isExpanded: _expanded2,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'LEVEL 3',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        for (Spell s in widget.character.spells)
                          if (s.level == 3) ...[
                            TextButton(
                              child: Text(s.name.toUpperCase()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpellDetailsPage(
                                      spell: s,
                                      character: widget.character,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    _showDeleteDialog(s);
                                  },
                                );
                              },
                            ),
                          ],
                      ],
                    ),
                    isExpanded: _expanded3,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'LEVEL 4',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        for (Spell s in widget.character.spells)
                          if (s.level == 4) ...[
                            TextButton(
                              child: Text(s.name.toUpperCase()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpellDetailsPage(
                                      spell: s,
                                      character: widget.character,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    _showDeleteDialog(s);
                                  },
                                );
                              },
                            ),
                          ],
                      ],
                    ),
                    isExpanded: _expanded4,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'LEVEL 5',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        for (Spell s in widget.character.spells)
                          if (s.level == 5) ...[
                            TextButton(
                              child: Text(s.name.toUpperCase()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpellDetailsPage(
                                      spell: s,
                                      character: widget.character,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    _showDeleteDialog(s);
                                  },
                                );
                              },
                            ),
                          ],
                      ],
                    ),
                    isExpanded: _expanded5,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'LEVEL 6',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        for (Spell s in widget.character.spells)
                          if (s.level == 6) ...[
                            TextButton(
                              child: Text(s.name.toUpperCase()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpellDetailsPage(
                                      spell: s,
                                      character: widget.character,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    _showDeleteDialog(s);
                                  },
                                );
                              },
                            ),
                          ],
                      ],
                    ),
                    isExpanded: _expanded6,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'LEVEL 7',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        for (Spell s in widget.character.spells)
                          if (s.level == 7) ...[
                            TextButton(
                              child: Text(s.name.toUpperCase()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpellDetailsPage(
                                      spell: s,
                                      character: widget.character,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    _showDeleteDialog(s);
                                  },
                                );
                              },
                            ),
                          ],
                      ],
                    ),
                    isExpanded: _expanded7,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'LEVEL 8',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        for (Spell s in widget.character.spells)
                          if (s.level == 8) ...[
                            TextButton(
                              child: Text(s.name.toUpperCase()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpellDetailsPage(
                                      spell: s,
                                      character: widget.character,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    _showDeleteDialog(s);
                                  },
                                );
                              },
                            ),
                          ],
                      ],
                    ),
                    isExpanded: _expanded8,
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, isExpanded) {
                      return const ListTile(
                        title: Text(
                          'LEVEL 9',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        for (Spell s in widget.character.spells)
                          if (s.level == 9) ...[
                            TextButton(
                              child: Text(s.name.toUpperCase()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpellDetailsPage(
                                      spell: s,
                                      character: widget.character,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                setState(
                                  () {
                                    _showDeleteDialog(s);
                                  },
                                );
                              },
                            ),
                          ],
                      ],
                    ),
                    isExpanded: _expanded9,
                    canTapOnHeader: true,
                  ),
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  if (panelIndex == 0) {
                    _expanded0 = !isExpanded;
                  } else if (panelIndex == 1) {
                    _expanded1 = !isExpanded;
                  } else if (panelIndex == 2) {
                    _expanded2 = !isExpanded;
                  } else if (panelIndex == 3) {
                    _expanded3 = !isExpanded;
                  } else if (panelIndex == 4) {
                    _expanded4 = !isExpanded;
                  } else if (panelIndex == 5) {
                    _expanded5 = !isExpanded;
                  } else if (panelIndex == 6) {
                    _expanded6 = !isExpanded;
                  } else if (panelIndex == 7) {
                    _expanded7 = !isExpanded;
                  } else if (panelIndex == 8) {
                    _expanded8 = !isExpanded;
                  } else if (panelIndex == 9) {
                    _expanded9 = !isExpanded;
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
