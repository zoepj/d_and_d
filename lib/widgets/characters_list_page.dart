import 'dart:convert';

import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:d_and_d/widgets/side_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'add_character_page.dart';
import 'character/character_main_page.dart';

const Map<String, dynamic> jsonSample = {
  "name": "Kerri Amblecrown",
  "imagePath": "assets/img.png",
  "level": 3,
  "armor": 14,
  "initiative": 1,
  "speed": 35,
  "currentHitPoints": 34,
  "temporaryHitPoints": 0,
  "race": "Elf",
  "characterClass": "Sorcerer",
  "background": "Gambler",
  "armors": [
    {
      "equipped": true,
      "name": "leather armor",
      "type": "light armor",
      "armorClass": 14,
      "characteristic": "idk",
      "cost": "5 po",
      "strength": 1,
      "stealth": false,
      "weight": "-",
      "info": "-",
    }
  ],
  "weapons": [
    {
      "ammunition": 0,
      "name": "Longbow",
      "type": "Light",
      "damage": "1d6",
      "cost": "5 po",
      "weight": "5lb",
      "features": "",
      "info": ""
    },
  ],
  "objects": [],
  "spells": [
    {
      "level": 0,
      "name": "name",
      "damageType": "acid",
      "school": "divination",
      "castingTime": "1 action",
      "range": "Personal",
      "components": "",
      "duration": "",
      "description": ""
    },
    {
      "level": 2,
      "name": "name2",
      "damageType": "acid",
      "school": "divination",
      "castingTime": "1 action",
      "range": "Personal",
      "components": "",
      "duration": "",
      "description": ""
    },
    {
      "level": 0,
      "name": "name3",
      "damageType": "acid",
      "school": "divination",
      "castingTime": "1 action",
      "range": "Personal",
      "components": "",
      "duration": "",
      "description":
          "After touching an object that is not being carried or worn, you place a curse on it that harvests the cold regrets of a creature that you've killed. The next creature that attempts to pick up the object must succeed on a Wisdom saving throw or be grabbed by a ghastly transparent claw manifesting from the object. The claw deals 2d4 cold damage and 1d4 necrotic damage when this happens. If the Wisdom save succeeds, no necrotic damage is dealt, the cold damage dealt is halved, and the claw manifests only to slap whoever picks up the object."
    }
  ],
  'spellSave': 2,
  'spellAttackBonus': 7,
  'spellcastingAbility': 'charisma',
};

const Map<String, dynamic> jsonSample2 = {
  "name": "John Doe",
  "imagePath": "assets/img.png",
  "level": 5,
  "armor": 20,
  "initiative": 0,
  "speed": 33,
  "currentHitPoints": 36,
  "temporaryHitPoints": 2,
  "race": "Elf",
  "characterClass": "Sorcerer",
  "background": "Gambler",
  "spellcastingAbility": "charisma"
};

Future<Character> getJsonData(String path) async {
  return await Future.delayed(
      const Duration(
        seconds: 1,
      ), () async {
    final String json = await rootBundle.loadString(path);
    Map<String, dynamic> data = jsonDecode(json);
    return Character.fromJson(data);
  });
}

Character character = Character.fromJson(jsonSample);
Character character2 = Character.fromJson(jsonSample2);

class CharactersListPage extends StatefulWidget {
  CharactersListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  List<Character> charactersList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    charactersList = DB.getCharacters();
    return Scaffold(
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
        title: const Text("Characters"),
      ),
      body: charactersList.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "You don't have any character",
                        style: TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Tap on the button below to add one"),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
                const Icon(Icons.subdirectory_arrow_right, size: 100),
              ],
            )
          : ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: charactersList.length,
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  child: Center(child: Text(charactersList[index].name)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterMainPage(
                          character: charactersList[index],
                          initialIndex: 0,
                        ),
                      ),
                    );
                  },
                  onLongPress: () {
                    setState(
                      () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Do you want to delete ' +
                                  charactersList[index].name),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('CANCEL'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    DB.removeCharacter(charactersList[index]);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CharactersListPage()),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: Container(
                                    child: const Text('DELETE'),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCharacterPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
