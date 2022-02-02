import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/models/my_object.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:flutter/material.dart';

import '../../side_drawer.dart';

class MyObjectWidget extends StatefulWidget {
  const MyObjectWidget(
      {Key? key, required this.myObject, required this.character})
      : super(key: key);
  final MyObject myObject;
  final Character character;

  @override
  State<MyObjectWidget> createState() => _MyObjectWidgetState();
}

class _MyObjectWidgetState extends State<MyObjectWidget> {
  bool _modifying = false;

  final _formKey = GlobalKey<FormState>();

  final _nameTextStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  final _textStyle = const TextStyle(
    height: 1.5,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  final InputDecoration _formDecoration = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        drawer: const SideDrawer(),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text(widget.character.name),
          actions: [
            _modifying
                ? IconButton(
                    icon: const Icon(
                      Icons.check,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _modifying = false;
                          if (_formKey.currentState!.validate()) {
                            DB.updateMyObject(
                                widget.myObject, widget.character);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyObjectWidget(
                                    character: widget.character,
                                    myObject: widget.myObject,
                                  ),
                                ),
                                (Route<dynamic> route) => false);
                          }
                        },
                      );
                    },
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.edit,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _modifying = true;
                        },
                      );
                    },
                  ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.myObject.name.toUpperCase(),
                style: _nameTextStyle,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "QUANTITY: ",
                    style: _textStyle,
                  ),
                  Text(
                    "${widget.myObject.quantity}",
                    style: _textStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "INFORMATION: ",
                    style: _textStyle,
                  ),
                  Text(
                    widget.myObject.info,
                    style: _textStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
