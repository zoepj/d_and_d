import 'package:d_and_d/models/character.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.character}) : super(key: key);
  final Character character;


  @override
  _DetailsPageState createState() => _DetailsPageState();
}



class _DetailsPageState extends State<DetailsPage> {
bool _expanded1 = false;
bool _expanded2 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Level ${widget.character.level}", style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,),),
                  ],
                ),
                Text(
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
                        Text(widget.character.armor.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 17),),
                        const Text("ARMOR",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),),
                      ],
                    ),
                    Column(
                      children: [
                        Text(widget.character.initiative.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 17),),
                        const Text("INITIATIVE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),),
                      ],
                    ),
                    Column(
                      children: [
                        Text(widget.character.speed.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 17),),
                        const Text("SPEED",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),),
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
                        Text(widget.character.currentHitPoints.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 17),),
                        const Text("CURRENT HIT POINTS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),),
                      ],
                    ),
                    Column(
                      children: [
                        Text("${widget.character.temporaryHitPoints!}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 17),),
                        const Text("TEMPORARY HIT POINTS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),),
                      ],
                    ),
                  ],
                ), const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("RACE: ${widget.character.race}",
                            style: const TextStyle(height: 2,
                                fontWeight: FontWeight.w400,
                                fontSize: 17)),
                        Text("CLASS: ${widget.character.characterClass}",
                            style: const TextStyle(height: 1.5,
                                fontWeight: FontWeight.w400,
                                fontSize: 17)),
                        Text("BACKGROUND: ${widget.character.background}\n",
                            style: const TextStyle(height: 1.5,
                                fontWeight: FontWeight.w400,
                                fontSize: 17)),
                      ],
                    ),
                    Expanded(child: Container()),

                  ],
                ),
                ExpansionPanelList(
                  animationDuration: const Duration(milliseconds: 1500),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, isExpanded) {
                        return const ListTile(
                          title: Text('FEATURES AND TRAITS'),
                        );
                      },
                      body: ListTile(
                        title: Text('LOOKS: ${widget.character.looks}\n'
                            'PERSONALITY TRAITS: ${widget.character.traits}\n'
                            'IDEALS: ${widget.character.ideals}\n'
                            'BONDS: ${widget.character.bonds}\n'
                            'FLAWS: ${widget.character.flaws}\n',
                            style: const TextStyle(height: 2,
                                fontWeight: FontWeight.w400,
                                fontSize: 17),),
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
                        title: Text('LANGUAGES: ${widget.character.languages}\n'
                            'ABILITIES: ${widget.character.abilities}\n',
                          style: const TextStyle(height: 2,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),),
                      ),
                      isExpanded: _expanded2,
                      canTapOnHeader: true,
                    ),
                  ],
                  dividerColor: Colors.grey,
                  expansionCallback: (panelIndex, isExpanded) {
                    if (panelIndex==0) {
                      _expanded1 = !isExpanded;
                    } else {
                      _expanded2 = !isExpanded;
                    }
                    setState(() {

                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
