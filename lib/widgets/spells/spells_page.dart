import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/spell.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import '../side_drawer.dart';
import 'spell_details_page.dart';

class SpellsPage extends StatelessWidget {
  const SpellsPage({Key? key, required this.character}) : super(key: key);
  final Character character;
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
                    Text("${character.spellSave}",
                      style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17),),
                    const Text("SPELL SAVE\nDC",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),),
                  ],
                ),
                Column(
                  children: [
                    Text("${character.spellAttackBonus}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 17),),
                    const Text("SPELL ATTACK\nBONUS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),),
                  ],
                ),
                Column(
                  children: [
                    Text(EnumToString.convertToString(character.spellcastingAbility).toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 17),),
                    const Text("SPELLCASTING\nABILITY",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),),
                  ],
                ),
              ],
            ),
            const Text("\n"),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const Text("\nCatnips (level 0):",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            for (Spell s in character.spells)
              if (s.level == 0)... [
                TextButton(
                  child: Text(s.name),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                        spell: s,
                        ),
                      ),
                    );
                  },
                ),
              ],
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const Text("Level 1:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            for (Spell s in character.spells)
              if (s.level == 1)... [
                TextButton(
                  child: Text(s.name),
                  onPressed: () {
                    Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                          spell: s,
                        ),
                      ),
                    );
                  },
                )
              ],

            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),

            const Text("Level 2:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            for (Spell s in character.spells)
              if (s.level == 2)... [
                TextButton(
                  child: Text(s.name),
                  onPressed: () {
                    Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                          spell: s,
                        ),
                      ),
                    );
                  },
                ),
              ],
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const Text("Level 3:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            for (Spell s in character.spells)
              if (s.level == 3)... [
                TextButton(
                  child: Text(s.name),
                  onPressed: () {
                    Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                          spell: s,
                        ),
                      ),
                    );
                  },
                ),
              ],
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const Text("Level 4:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            for (Spell s in character.spells)
              if (s.level == 4)... [
                TextButton(
                  child: Text(s.name),
                  onPressed: () {
                    Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                          spell: s,
                        ),
                      ),
                    );
                  },
                ),
              ],
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const Text("Level 5:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            for (Spell s in character.spells)
              if (s.level == 5)... [
                TextButton(
                  child: Text(s.name),
                  onPressed: () {
                    Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                          spell: s,
                        ),
                      ),
                    );
                  },
                ),
              ],
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const Text("Level 6:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            for (Spell s in character.spells)
              if (s.level == 6)... [
                TextButton(
                  child: Text(s.name),
                  onPressed: () {
                    Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                          spell: s,
                        ),
                      ),
                    );
                  },
                ),
              ],
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const Text("Level 7:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            for (Spell s in character.spells)
              if (s.level == 7)... [
                TextButton(
                  child: Text(s.name),
                  onPressed: () {
                    Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                          spell: s,
                        ),
                      ),
                    );
                  },
                ),
              ],
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const Text("Level 8:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            for (Spell s in character.spells)
              if (s.level == 8)... [
                TextButton(
                  child: Text(s.name),
                  onPressed: () {
                    Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                          spell: s,
                        ),
                      ),
                    );
                  },
                ),
              ],
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const Text("Level 9:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            for (Spell s in character.spells)
              if (s.level == 9)... [
                TextButton(
                  child: Text(s.name),
                  onPressed: () {
                    Navigator.push( context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                          spell: s,
                        ),
                      ),
                    );
                  },
                ),
              ],
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        ),
    );
  }
}
