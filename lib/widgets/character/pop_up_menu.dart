import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// This is the type used by the popup menu below.
enum PopUpItem { favourite, share, modify }

// This menu button widget updates a _selection field (of type WhyFarther,
// not shown here).

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({Key? key}) : super(key: key);

  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem<PopUpItem>(
          value: PopUpItem.favourite,
          child: Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              SizedBox(width: 6),
              Text("Favourite"),
            ],
          ),
        ),
        PopupMenuItem(
          value: PopUpItem.favourite,
          child: Row(
            children: const [
              Icon(
                Icons.share,
                color: Colors.black,
              ),
              SizedBox(width: 6),
              Text("Share"),
            ],
          ),
        ),
        PopupMenuItem(
          value: PopUpItem.favourite,
          child: Row(
            children: const [
              Icon(
                Icons.edit,
                color: Colors.black,
              ),
              SizedBox(width: 6),
              Text("Modify"),
            ],
          ),
        ),
      ],
    );
  }
}
