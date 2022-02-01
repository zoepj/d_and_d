import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import 'spell_details_widget.dart';

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                      Text(
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
                      Text(
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
                      Text(
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
                animationDuration: const Duration(milliseconds: 1500),
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
                    body: Column(children: [
                      for (Spell s in widget.character.spells)
                        if (s.level == 0) ...[
                          TextButton(
                            child: Text(s.name.toUpperCase()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsWidget(
                                    spell: s,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                    ]),
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
                    body: Column(children: [
                      for (Spell s in widget.character.spells)
                        if (s.level == 1) ...[
                          TextButton(
                            child: Text(s.name.toUpperCase()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsWidget(
                                    spell: s,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                    ]),
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
                    body: Column(children: [
                      for (Spell s in widget.character.spells)
                        if (s.level == 2) ...[
                          TextButton(
                            child: Text(s.name.toUpperCase()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsWidget(
                                    spell: s,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                    ]),
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
                    body: Column(children: [
                      for (Spell s in widget.character.spells)
                        if (s.level == 3) ...[
                          TextButton(
                            child: Text(s.name.toUpperCase()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsWidget(
                                    spell: s,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                    ]),
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
                    body: Column(children: [
                      for (Spell s in widget.character.spells)
                        if (s.level == 4) ...[
                          TextButton(
                            child: Text(s.name.toUpperCase()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsWidget(
                                    spell: s,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                    ]),
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
                    body: Column(children: [
                      for (Spell s in widget.character.spells)
                        if (s.level == 5) ...[
                          TextButton(
                            child: Text(s.name.toUpperCase()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsWidget(
                                    spell: s,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                    ]),
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
                    body: Column(children: [
                      for (Spell s in widget.character.spells)
                        if (s.level == 6) ...[
                          TextButton(
                            child: Text(s.name.toUpperCase()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsWidget(
                                    spell: s,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                    ]),
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
                    body: Column(children: [
                      for (Spell s in widget.character.spells)
                        if (s.level == 7) ...[
                          TextButton(
                            child: Text(s.name.toUpperCase()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsWidget(
                                    spell: s,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                    ]),
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
                    body: Column(children: [
                      for (Spell s in widget.character.spells)
                        if (s.level == 8) ...[
                          TextButton(
                            child: Text(s.name.toUpperCase()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsWidget(
                                    spell: s,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                    ]),
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
                    body: Column(children: [
                      for (Spell s in widget.character.spells)
                        if (s.level == 9) ...[
                          TextButton(
                            child: Text(s.name.toUpperCase()),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpellDetailsWidget(
                                    spell: s,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                    ]),
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
