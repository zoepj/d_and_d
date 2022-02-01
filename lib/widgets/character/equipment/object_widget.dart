import 'package:d_and_d/models/my_object.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';

class MyObjectWidget extends StatelessWidget {
  const MyObjectWidget({Key? key, required this.myObject}) : super(key: key);
  final MyObject myObject;

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
          title: Text(""),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(myObject.name.toUpperCase(),
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.bold, fontSize: 20)),
              Text("\nQUANTITY: ${myObject.quantity}",
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 17)),
              Text("INFORMATION: ${myObject.info}",
                  style: const TextStyle(
                      height: 1.5, fontWeight: FontWeight.w400, fontSize: 17)),
            ],
          ),
        ));
  }
}
