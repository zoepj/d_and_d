import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/widgets/character/spells/spells_page.dart';
import 'package:d_and_d/widgets/character/tab_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../side_drawer.dart';
import 'characteristics_page.dart';
import 'details/details_page.dart';
import 'equipment/equipment_page.dart';

class CharacterMainPage extends StatefulWidget {
  const CharacterMainPage({
    Key? key,
    required this.character,
    required this.initialIndex,
  }) : super(key: key);

  final Character character;
  final int initialIndex;

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
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<TabInformation> tabs = getAllTabInformation(context);

    return Scaffold(
      drawer: const SideDrawer(),
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
        children: [
          DetailsPage(
            character: widget.character,
          ),
          EquipmentPage(
            character: widget.character,
          ),
          CharacteristicsPage(
            character: widget.character,
          ),
          SpellsPage(
            character: widget.character,
          ),
        ],
      ),
    );
  }
}
