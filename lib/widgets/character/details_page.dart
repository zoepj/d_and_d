import 'package:d_and_d/models/character.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("level ${character.level}"),
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
                      Text(character.armor.toString()),
                      const Text("ARMOR"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(character.initiative.toString()),
                      const Text("INDICATIVE"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(character.speed.toString()),
                      const Text("SPEED"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("RACE: ${character.race}"),
                      Text("CLASS: ${character.characterClass}"),
                      Text("BACKGROUND: ${character.background}"),
                      Text("ARMORS: ${character.armors}"),
                      Text("WEAPONS: ${character.weapons}")
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
