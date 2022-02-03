import 'package:d_and_d/widgets/videos/list_videos_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'characters_list_page.dart';
import 'dices/roll_page.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.65,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'DragonsRoll',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Characters'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => CharactersListPage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.crop_square),
              title: const Text('Dices'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RollPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book),
              title: const Text('Guide'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListVideosPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
