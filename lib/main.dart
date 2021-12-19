import 'dart:convert';

import 'package:d_and_d/widgets/character/character_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'models/character.dart';

void main() {
  runApp(const MyApp());
}

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "d and d"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CharacterMainPage(
        character: Character.fromJson(jsonSample),
      ),
    );
  }
}
