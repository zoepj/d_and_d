import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/widgets/character/spells_page.dart';
import 'package:d_and_d/widgets/character/tab_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'characteristics_page.dart';
import 'details_page.dart';
import 'equipment_page.dart';

class CharacterMainPage extends StatefulWidget {
  const CharacterMainPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  _CharacterMainPageState createState() => _CharacterMainPageState();
}

class _CharacterMainPageState extends State<CharacterMainPage>
    with SingleTickerProviderStateMixin {
  /// Controller instance to coordinate the tabs
  late TabController tabController;

  void _updateIndex(int value) {
    setState(() {
      tabController.index = value;
    });
  }

  @override
  void initState() {
    super.initState();
    // Tab controller initialization
    tabController = TabController(
      length: 4,
      initialIndex: 1,
      vsync: this,
    );
/*
    context.read(tabIndexProvider).addListener((state) {
      if (state != tabController.index) {
        tabController.animateTo(state);
      }
    });
 */
  }

  @override
  Widget build(BuildContext context) {
    List<TabInformation> tabs = getAllTabInformation(context);

    return Scaffold(
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
        title: Text(widget.character.name),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: tabController.index,
        items: [
          for (var tab in tabs)
            BottomNavigationBarItem(
              label: tab.title,
              icon: Icon(tab.icon),
            ),
        ],
        onTap: _updateIndex,
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          DetailsPage(),
          EquipmentPage(),
          CharacteristicsPage(),
          SpellsPage(),
        ],
      ),
    );
  }
}
