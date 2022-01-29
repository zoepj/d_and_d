import 'package:d_and_d/models/character.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.character}) : super(key: key);

  final Character character;

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
                    Text("Level ${character.level}", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,),),
                  ],
                ),
                Text(
                  character.name,
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
                        Text(character.armor.toString(),
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
                        Text(character.initiative.toString(),
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
                        Text(character.speed.toString(),
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
                        Text(character.currentHitPoints.toString(),
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
                        Text("${character.temporaryHitPoints!}",
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
                ),const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("RACE: ${character.race}",
                            style: const TextStyle(height: 2,
                                fontWeight: FontWeight.w400,
                                fontSize: 17)),
                        Text("CLASS: ${character.characterClass}",
                            style: const TextStyle(height: 1.5,
                                fontWeight: FontWeight.w400,
                                fontSize: 17)),
                        Text("BACKGROUND: ${character.background}",
                            style: const TextStyle(height: 1.5,
                                fontWeight: FontWeight.w400,
                                fontSize: 17)),
                      ],
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
