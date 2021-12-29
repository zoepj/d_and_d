import 'package:d_and_d/icons/my_icons.dart';
import 'package:flutter/material.dart';

/// CLass and function used to have internationalize bottom page navigation

/// Store all useful tab information
class TabInformation {
  TabInformation(
      {required this.order, required this.icon, required this.title});

  /// Tab order
  final int order;

  /// Tab Icon to show
  final IconData icon;

  /// Tab title to show under [icon]
  final String title;
}

const int nbTabs = 4;

List<TabInformation> getAllTabInformation(BuildContext context) {
  return [
    TabInformation(
      order: 1,
      title: "Details",
      icon: MyIcons.userId,
    ),
    TabInformation(
      order: 2,
      title: "Equipment",
      icon: MyIcons.sword,
    ),
    TabInformation(
      order: 3,
      title: "Characteristics",
      icon: MyIcons.octahedron,
    ),
    TabInformation(
      order: 4,
      title: "Spells",
      icon: MyIcons.shield,
    ),
  ];
}
