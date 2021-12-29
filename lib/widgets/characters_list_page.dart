import 'dart:convert';

import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/widgets/side_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'character/character_main_page.dart';

const Map<String, dynamic> jsonSample = {
  "name": "Kerri Amblecrown",
  "imagePath": "assets/img.png",
  "level": 3,
  "armor": 14,
  "indicative": 1,
  "speed": 35,
  "currentHitPoints": 34,
  "temporaryHitPoints": 0,
  "race": "Elf",
  "characterClass": "Sorcerer",
  "background": "Gambler"
};

const Map<String, dynamic> jsonSample2 = {
  "name": "John Doe",
  "imagePath": "assets/img.png",
  "level": 5,
  "armor": 20,
  "indicative": 0,
  "speed": 33,
  "currentHitPoints": 36,
  "temporaryHitPoints": 2,
  "race": "Elf",
  "characterClass": "Sorcerer",
  "background": "Gambler"
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

class CharactersListPage extends StatelessWidget {
  CharactersListPage({
    Key? key,
  }) : super(key: key);
  final List<Character> charactersList = [
    character,
    character2,
    character,
    character,
    character2,
    character,
    character,
    character,
    character,
  ];
  @override
  Widget build(BuildContext context) {
    Character character = Character.fromJson(jsonSample);
    Character character2 = Character.fromJson(jsonSample2);
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: ListView.separated(
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
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}