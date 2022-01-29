import 'package:d_and_d/models/character.dart';
import 'package:flutter/material.dart';

class CharacteristicsPage extends StatelessWidget {
  const CharacteristicsPage({Key? key, required this.character}) : super(key: key);
  final Character character;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Characteristics:"),
          Text("Strength: ${character.characteristics.strength}"),
          Text("Dexterity: ${character.characteristics.dexterity}"),
          Text("Constitution: ${character.characteristics.constitution}"),
          Text("Wisdom: ${character.characteristics.wisdom}"),
          Text("Intelligence: ${character.characteristics.intelligence}"),
          Text("Charisma: ${character.characteristics.charisma}"),

          const Text("\n Saving throws:"),
          Text("Strength: ${character.savingThrows.strength}"),
          Text("Dexterity: ${character.savingThrows.dexterity}"),
          Text("Constitution: ${character.savingThrows.constitution}"),
          Text("Wisdom: ${character.savingThrows.wisdom}"),
          Text("Intelligence: ${character.savingThrows.intelligence}"),
          Text("Charisma: ${character.savingThrows.charisma}"),

          const Text("\n Skills:"),
          Text("Athletics: ${character.skills.athletics}"),
          Text("Acrobatics: ${character.skills.acrobatics}"),
          Text("Sleight of hand: ${character.skills.sleightOfHand}"),
          Text("Stealth: ${character.skills.stealth}"),
          Text("Arcana: ${character.skills.arcana}"),
          Text("History: ${character.skills.history}"),
          Text("Investigation: ${character.skills.investigation}"),
          Text("Nature: ${character.skills.nature}"),
          Text("Religion: ${character.skills.religion}"),
          Text("Animal handling: ${character.skills.animalHandling}"),
          Text("Insight: ${character.skills.insight}"),
          Text("Medicine: ${character.skills.medicine}"),
          Text("Perception: ${character.skills.perception}"),
          Text("Survival: ${character.skills.survival}"),
          Text("Deception: ${character.skills.deception}"),
          Text("Intimidation: ${character.skills.intimidation}"),
          Text("Performance: ${character.skills.performance}"),
          Text("Persuasion: ${character.skills.persuasion}"),


        ],
      ),
    );
  }
}
