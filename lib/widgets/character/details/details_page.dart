import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';
import '../character_main_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.character}) : super(key: key);
  final Character character;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _expanded1 = false;
  bool _expanded2 = false;
  bool _modifying = false;

  final TextStyle _integerTextStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  final TextStyle _stringTextStyle1 = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  final TextStyle _stringTextStyle2 = const TextStyle(
    height: 2,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  final InputDecoration _formDecoration = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
  );

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
                                          initialIndex: 0,
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
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Level ",
                          style: _integerTextStyle,
                        ),
                        _modifying
                            ? SizedBox(
                                width: 20,
                                child: TextFormField(
                                  initialValue:
                                      widget.character.level.toString(),
                                  keyboardType: TextInputType.number,
                                  validator: (enteredValue) {
                                    if (enteredValue == null ||
                                        enteredValue.isEmpty) {
                                      return 'Missing element';
                                    } else {
                                      widget.character.level =
                                          int.parse(enteredValue);
                                    }
                                    return null;
                                  },
                                  style: _integerTextStyle,
                                  decoration: _formDecoration,
                                ),
                              )
                            : Text(
                                "${widget.character.level}",
                                style: _integerTextStyle,
                              ),
                      ],
                    ),
                    _modifying
                        ? SizedBox(
                            width: 250,
                            child: TextFormField(
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                              initialValue: widget.character.name.toString(),
                              validator: (enteredValue) {
                                if (enteredValue == null ||
                                    enteredValue.isEmpty) {
                                  return 'Missing element';
                                } else {
                                  widget.character.name = enteredValue;
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 1.0),
                              ),
                            ),
                          )
                        : Text(
                            widget.character.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                    const Icon(
                      Icons.account_box_sharp,
                      size: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            _modifying
                                ? SizedBox(
                                    width: 20,
                                    child: TextFormField(
                                      initialValue:
                                          widget.character.armor.toString(),
                                      keyboardType: TextInputType.number,
                                      validator: (enteredValue) {
                                        if (enteredValue == null ||
                                            enteredValue.isEmpty) {
                                          return 'Missing element';
                                        } else {
                                          widget.character.armor =
                                              int.parse(enteredValue);
                                        }
                                        return null;
                                      },
                                      style: _integerTextStyle,
                                      decoration: _formDecoration,
                                    ),
                                  )
                                : Text(
                                    widget.character.armor.toString(),
                                    style: _integerTextStyle,
                                  ),
                            Text(
                              "ARMOR",
                              textAlign: TextAlign.center,
                              style: _stringTextStyle1,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            _modifying
                                ? SizedBox(
                                    width: 20,
                                    child: TextFormField(
                                      initialValue: widget.character.initiative
                                          .toString(),
                                      keyboardType: TextInputType.number,
                                      validator: (enteredValue) {
                                        if (enteredValue == null ||
                                            enteredValue.isEmpty) {
                                          return 'Missing element';
                                        } else {
                                          widget.character.initiative =
                                              int.parse(enteredValue);
                                        }
                                        return null;
                                      },
                                      style: _integerTextStyle,
                                      decoration: _formDecoration,
                                    ),
                                  )
                                : Text(
                                    widget.character.initiative.toString(),
                                    style: _integerTextStyle,
                                  ),
                            Text(
                              "INITIATIVE",
                              textAlign: TextAlign.center,
                              style: _stringTextStyle1,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            _modifying
                                ? SizedBox(
                                    width: 20,
                                    child: TextFormField(
                                      initialValue:
                                          widget.character.speed.toString(),
                                      keyboardType: TextInputType.number,
                                      validator: (enteredValue) {
                                        if (enteredValue == null ||
                                            enteredValue.isEmpty) {
                                          return 'Missing element';
                                        } else {
                                          widget.character.speed =
                                              int.parse(enteredValue);
                                        }
                                        return null;
                                      },
                                      style: _integerTextStyle,
                                      decoration: _formDecoration,
                                    ),
                                  )
                                : Text(
                                    widget.character.speed.toString(),
                                    style: _integerTextStyle,
                                  ),
                            Text(
                              "SPEED",
                              textAlign: TextAlign.center,
                              style: _stringTextStyle1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            _modifying
                                ? SizedBox(
                                    width: 20,
                                    child: TextFormField(
                                      initialValue: widget
                                          .character.currentHitPoints
                                          .toString(),
                                      keyboardType: TextInputType.number,
                                      validator: (enteredValue) {
                                        if (enteredValue == null ||
                                            enteredValue.isEmpty) {
                                          return 'Missing element';
                                        } else {
                                          widget.character.currentHitPoints =
                                              int.parse(enteredValue);
                                        }
                                        return null;
                                      },
                                      style: _integerTextStyle,
                                      decoration: _formDecoration,
                                    ),
                                  )
                                : Text(
                                    widget.character.currentHitPoints
                                        .toString(),
                                    style: _integerTextStyle,
                                  ),
                            Text(
                              "CURRENT HIT POINTS",
                              textAlign: TextAlign.center,
                              style: _stringTextStyle1,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            _modifying
                                ? SizedBox(
                                    width: 20,
                                    child: TextFormField(
                                      initialValue: widget
                                          .character.temporaryHitPoints
                                          .toString(),
                                      keyboardType: TextInputType.number,
                                      validator: (enteredValue) {
                                        if (enteredValue == null ||
                                            enteredValue.isEmpty) {
                                          return 'Missing element';
                                        } else {
                                          widget.character.temporaryHitPoints =
                                              int.parse(enteredValue);
                                        }
                                        return null;
                                      },
                                      style: _integerTextStyle,
                                      decoration: _formDecoration,
                                    ),
                                  )
                                : Text(
                                    "${widget.character.temporaryHitPoints!}",
                                    style: _integerTextStyle),
                            Text(
                              "TEMPORARY HIT POINTS",
                              textAlign: TextAlign.center,
                              style: _stringTextStyle1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "RACE: ",
                                  style: _stringTextStyle2,
                                ),
                                _modifying
                                    ? SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          initialValue:
                                              widget.character.race.toString(),
                                          validator: (enteredValue) {
                                            if (enteredValue == null ||
                                                enteredValue.isEmpty) {
                                              return 'Missing element';
                                            } else {
                                              widget.character.race =
                                                  enteredValue;
                                            }
                                            return null;
                                          },
                                          style: _stringTextStyle2,
                                          decoration: _formDecoration,
                                        ),
                                      )
                                    : Text(
                                        "${widget.character.race}",
                                        style: _stringTextStyle2,
                                      ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "CLASS: ",
                                  style: _stringTextStyle2,
                                ),
                                _modifying
                                    ? SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          initialValue: widget
                                              .character.characterClass
                                              .toString(),
                                          validator: (enteredValue) {
                                            if (enteredValue == null ||
                                                enteredValue.isEmpty) {
                                              return 'Missing element';
                                            } else {
                                              widget.character.characterClass =
                                                  enteredValue;
                                            }
                                            return null;
                                          },
                                          style: _stringTextStyle2,
                                          decoration: _formDecoration,
                                        ),
                                      )
                                    : Text(
                                        "${widget.character.characterClass}",
                                        style: _stringTextStyle2,
                                      ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "BACKGROUND: ",
                                  style: _stringTextStyle2,
                                ),
                                _modifying
                                    ? SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          initialValue: widget
                                              .character.background
                                              .toString(),
                                          validator: (enteredValue) {
                                            if (enteredValue == null ||
                                                enteredValue.isEmpty) {
                                              return 'Missing element';
                                            } else {
                                              widget.character.background =
                                                  enteredValue;
                                            }
                                            return null;
                                          },
                                          style: _stringTextStyle2,
                                          decoration: _formDecoration,
                                        ),
                                      )
                                    : Text(
                                        "${widget.character.background}",
                                        style: _stringTextStyle2,
                                      ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ExpansionPanelList(
                      animationDuration: const Duration(milliseconds: 500),
                      children: [
                        ExpansionPanel(
                          headerBuilder: (BuildContext context, isExpanded) {
                            return const ListTile(
                              title: Text('FEATURES AND TRAITS'),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              'LOOKS: ${widget.character.looks}\n'
                              'PERSONALITY TRAITS: ${widget.character.traits}\n'
                              'IDEALS: ${widget.character.ideals}\n'
                              'BONDS: ${widget.character.bonds}\n'
                              'FLAWS: ${widget.character.flaws}\n',
                              style: const TextStyle(
                                  height: 2,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
                            ),
                          ),
                          isExpanded: _expanded1,
                          canTapOnHeader: true,
                        ),
                        ExpansionPanel(
                          headerBuilder: (BuildContext context, isExpanded) {
                            return const ListTile(
                              title: Text('KNOWN LANGUAGES AND ABILITIES'),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              'LANGUAGES: ${widget.character.languages}\n'
                              'ABILITIES: ${widget.character.abilities}\n',
                              style: const TextStyle(
                                  height: 2,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
