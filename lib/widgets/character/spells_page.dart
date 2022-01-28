import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:flutter/material.dart';

class SpellsPage extends StatelessWidget {
  const SpellsPage({Key? key, required this.character}) : super(key: key);
  final Character character;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Catnips:"),
            for (Spell s in character.spells) Text("Spell: " + s.name),
            const Text("1:"),
            const Text("2:"),
            const Text("3:"),
            const Text("4:"),
            const Text("5:"),
            const Text("6:"),
            const Text("7:"),
            const Text("8:"),
            const Text("9:"),
            for (Spell s in character.spells) Text(s.name),
          ],
        ),
    );
  }
}
