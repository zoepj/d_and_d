import 'package:d_and_d/models/my_object.dart';
import 'package:flutter/material.dart';

import '../side_drawer.dart';

class MyObjectPage extends StatelessWidget {
  const MyObjectPage({Key? key, required this.myObject}) : super(key: key);
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
          title: Text(myObject.name),
        ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("QUANTITY: ${myObject.quantity}",
                style: const TextStyle(height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: 17)),
            Text("INFORMATION: ${myObject.info}",
                style: const TextStyle(height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: 17)),
          ],
        ),
      )
    );
  }
}