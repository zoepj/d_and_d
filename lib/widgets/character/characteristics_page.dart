import 'package:d_and_d/models/character.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    "${widget.character.characteristics!.strength}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 17),
                  ),
                  const Text(
                    "STRENGTH",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${widget.character.characteristics!.dexterity}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 17),
                  ),
                  const Text(
                    "DEXTERITY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${widget.character.characteristics!.constitution}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 17),
                  ),
                  const Text(
                    "CONSTITUTION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          const Text("\n"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "${widget.character.characteristics!.wisdom}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 17),
                  ),
                  const Text(
                    "WISDOM",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${widget.character.characteristics!.intelligence}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 17),
                  ),
                  const Text(
                    "INTELLIGENCE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "${widget.character.characteristics!.charisma}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 17),
                  ),
                  const Text(
                    "CHARISMA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5, fontWeight: FontWeight.bold, fontSize: 13),
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
                      "SAVING THROWS:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Wrap(children: [
                    Row(
                      children: [
                        Text(
                          "Strength: ${widget.character.savingThrows!.strength}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Dexterity: ${widget.character.savingThrows!.dexterity}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Constitution: ${widget.character.savingThrows!.constitution}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Wisdom: ${widget.character.savingThrows!.wisdom}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Intelligence: ${widget.character.savingThrows!.intelligence}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Charisma: ${widget.character.savingThrows!.charisma}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ]),
                ),
                isExpanded: _expanded1,
                canTapOnHeader: true,
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, isExpanded) {
                  return const ListTile(
                    title: Text(
                      'SKILLS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Wrap(children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Athletics: ${widget.character.skills!.athletics}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Acrobatics: ${widget.character.skills!.acrobatics}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Sleight of hand: ${widget.character.skills!.sleightOfHand}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Stealth: ${widget.character.skills!.stealth}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Arcana: ${widget.character.skills!.arcana}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "History: ${widget.character.skills!.history}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Investigation: ${widget.character.skills!.investigation}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Nature: ${widget.character.skills!.nature}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Religion: ${widget.character.skills!.religion}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Animal handling: ${widget.character.skills!.animalHandling}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Insight: ${widget.character.skills!.insight}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Medicine: ${widget.character.skills!.medicine}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Perception: ${widget.character.skills!.perception}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Survival: ${widget.character.skills!.survival}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Deception: ${widget.character.skills!.deception}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Intimidation: ${widget.character.skills!.intimidation}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Performance: ${widget.character.skills!.performance}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Persuasion: ${widget.character.skills!.persuasion}",
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ]),
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
    );
  }
}
