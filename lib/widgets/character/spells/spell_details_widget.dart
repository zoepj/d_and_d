import 'package:d_and_d/models/spell.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';

class SpellDetailsWidget extends StatelessWidget {
  const SpellDetailsWidget({Key? key, required this.spell}) : super(key: key);
  final Spell spell;

  final TextStyle _nameTextStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  final _textStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
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
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              spell.name.toUpperCase(),
              style: _nameTextStyle,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "LEVEL:  ",
                  style: _textStyle,
                ),
                Text(
                  "${spell.level}",
                  style: _textStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "DAMAGE TYPE: ",
                  style: _textStyle,
                ),
                Text(
                  spell.damageType == null
                      ? ""
                      : EnumToString.convertToString(spell.damageType),
                  style: _textStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "SCHOOL OF MAGIC: ",
                  style: _textStyle,
                ),
                Text(
                  spell.damageType == null
                      ? ""
                      : EnumToString.convertToString(spell.school),
                  style: _textStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "CASTING TIME: ",
                  style: _textStyle,
                ),
                Text(
                  "${spell.castingTime}",
                  style: _textStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "RANGE: ",
                  style: _textStyle,
                ),
                Text(
                  "${spell.range}",
                  style: _textStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "COMPONENTS: ",
                  style: _textStyle,
                ),
                Text(
                  "${spell.components}",
                  style: _textStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "DURATION: ",
                  style: _textStyle,
                ),
                Text(
                  "${spell.duration}",
                  style: _textStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "DESCRIPTION: ",
                  style: _textStyle,
                ),
                Text(
                  "${spell.description}",
                  style: _textStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
