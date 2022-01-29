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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("${character.spellSave}"),
                    const Text("SPELL SAVE\nDC"),
                  ],
                ),
                Column(
                  children: [
                    Text("${character.spellAttackBonus}"),
                    const Text("SPELL ATTACK\nBONUS"),
                  ],
                ),
                Column(
                  children: [
                    Text(EnumToString.convertToString(character.spellcastingAbility)),
                    const Text("SPELLCASTING\nABILITY"),
                  ],
                ),
              ],
            ),

            const Text("\n\nCatnips (level 0):"),
            for (Spell s in character.spells)
              if (s.level == 0)... [
                TextButton(
                  child: Center(child: Text(s.name)),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => SpellDetailsPage(
                        spell: s,
                        ),
                      ),
                    );
                  },
                )
              ],
            const Text("Level 1:"),
            for (Spell s in character.spells)
              if (s.level == 1)... [
                TextButton(
                  child: Center(child: Text(s.name)),
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
            const Text("Level 2:"),
            for (Spell s in character.spells)
              if (s.level == 2)... [
                TextButton(
                  child: Center(child: Text(s.name)),
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
            const Text("Level 3:"),
            for (Spell s in character.spells)
              if (s.level == 3)... [
                TextButton(
                  child: Center(child: Text(s.name)),
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
            const Text("Level 4:"),
            for (Spell s in character.spells)
              if (s.level == 4)... [
                TextButton(
                  child: Center(child: Text(s.name)),
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
            const Text("Level 5:"),
            for (Spell s in character.spells)
              if (s.level == 5)... [
                TextButton(
                  child: Center(child: Text(s.name)),
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
            const Text("Level 6:"),
            for (Spell s in character.spells)
              if (s.level == 6)... [
                TextButton(
                  child: Center(child: Text(s.name)),
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
            const Text("Level 7:"),
            for (Spell s in character.spells)
              if (s.level == 7)... [
                TextButton(
                  child: Center(child: Text(s.name)),
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
            const Text("Level 8:"),
            for (Spell s in character.spells)
              if (s.level == 8)... [
                TextButton(
                  child: Center(child: Text(s.name)),
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
            const Text("Level 9:"),
            for (Spell s in character.spells)
              if (s.level == 9)... [
                TextButton(
                  child: Center(child: Text(s.name)),
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
          ],
        ),
    );
  }
}
