

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../side_drawer.dart';

class RollPage extends StatefulWidget {
  const RollPage({Key? key}) : super(key: key);

  @override
  _RollPageState createState() => _RollPageState();

}

class _RollPageState extends State<RollPage> {
  int _d2 = 0;
  int _d4 = 0;
  int _d6 = 0;
  int _d8 = 0;
  int _d10 = 0;
  int _d20 = 0;
  int _res = 0;

  void _incrementDC2(){
    setState(() {
      _d2 ++;
    });
  }
  void _decrementDC2(){
    setState(() {
      if (_d2 > 0) _d2 --;
    });
  }

  void _incrementDC4(){
    setState(() {
      _d4 ++;
    });
  }
  void _decrementDC4(){
    setState(() {
      if (_d4 > 0) _d4 --;
    });
  }


  void _incrementDC6(){
    setState(() {
      _d6 ++;
    });
  }
  void _decrementDC6(){
    setState(() {
      if (_d6 > 0) _d6 --;
    });
  }


  void _incrementDC8(){
    setState(() {
      _d8 ++;
    });
  }
  void _decrementDC8(){
    setState(() {
      if (_d8 > 0) _d8 --;
    });
  }


  void _incrementDC10(){
    setState(() {
      _d10 ++;
    });
  }
  void _decrementDC10(){
    setState(() {
      if (_d10 > 0) _d10 --;
    });
  }


  void _incrementDC20(){
    setState(() {
      _d20 ++;
    });
  }
  void _decrementDC20(){
    setState(() {
      if (_d20 > 0) _d20 --;
    });
  }

  void _roll(){
    setState(() {
      _res = 0;
      for (var i = 0; i<_d2; i ++){
        _res += 1 + Random().nextInt(3 - 1);
      }
      for (var i = 0; i<_d4; i ++){
        _res += 1 + Random().nextInt(5 - 1);
      }
      for (var i = 0; i<_d6; i ++){
        _res += 1 + Random().nextInt(7 - 1);
      }
      for (var i = 0; i<_d8; i ++){
        _res += 1 + Random().nextInt(9 - 1);
      }
      for (var i = 0; i<_d10; i ++){
        _res += 1 + Random().nextInt(11 - 1);
      }
      for (var i = 0; i<_d20; i ++){
        _res += 1 + Random().nextInt(21 - 1);
      }
    });
  }


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
          title: const Text("Dices"),
        ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column (

            children: [
              Row (
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [FloatingActionButton(
                        onPressed: _decrementDC2,
                        child: const Icon(Icons.remove)
                    ),],
                  ),Column(
                    children: [Text("$_d2", style: const TextStyle(height: 1.5,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),),],
                  ),Column(
                    children: [
                      FloatingActionButton(
                          onPressed: _incrementDC2,
                          child: const Icon(Icons.add)
                      ),],
                  ),
                ]
              ),
              const SizedBox(height: 20),
              Row (
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [FloatingActionButton(
                          onPressed: _decrementDC4,
                          child: const Icon(Icons.remove)
                      ),],
                    ),Column(
                      children: [Text("$_d4", style: const TextStyle(height: 1.5,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),),],
                    ),Column(
                      children: [
                        FloatingActionButton(
                            onPressed: _incrementDC4,
                            child: const Icon(Icons.add)
                        ),],
                    ),
                  ]
              ),
              const SizedBox(height: 20),
              Row (
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [FloatingActionButton(
                          onPressed: _decrementDC6,
                          child: const Icon(Icons.remove)
                      ),],
                    ),Column(
                      children: [Text("$_d6", style: const TextStyle(height: 1.5,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),),],
                    ),Column(
                      children: [
                        FloatingActionButton(
                            onPressed: _incrementDC6,
                            child: const Icon(Icons.add)
                        ),],
                    ),
                  ]
              ),
              const SizedBox(height: 20),
              Row (
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [FloatingActionButton(
                          onPressed: _decrementDC8,
                          child: const Icon(Icons.remove)
                      ),],
                    ),Column(
                      children: [Text("$_d8", style: const TextStyle(height: 1.5,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),),],
                    ),Column(
                      children: [
                        FloatingActionButton(
                            onPressed: _incrementDC8,
                            child: const Icon(Icons.add)
                        ),],
                    ),
                  ]
              ),

              const SizedBox(height: 20),
              Row (
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [FloatingActionButton(
                          onPressed: _decrementDC10,
                          child: const Icon(Icons.remove)
                      ),],
                    ),Column(
                      children: [Text("$_d10", style: const TextStyle(height: 1.5,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),),],
                    ),Column(
                      children: [
                        FloatingActionButton(
                            onPressed: _incrementDC10,
                            child: const Icon(Icons.add)
                        ),],
                    ),
                  ]
              ),
              const SizedBox(height: 20),
              Row (
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [FloatingActionButton(
                          onPressed: _decrementDC20,
                          child: const Icon(Icons.remove)
                      ),],
                    ),Column(
                      children: [Text("$_d20", style: const TextStyle(height: 1.5,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),),],
                    ),Column(
                      children: [
                        FloatingActionButton(
                            onPressed: _incrementDC20,
                            child: const Icon(Icons.add)
                        ),],
                    ),
                  ]
              ),

              const SizedBox(height: 20),
              Row (
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [FloatingActionButton(
                    onPressed: _roll,
                    child: const Text("ROLL", style: TextStyle(fontSize: 18),),
                  ),
                  ]
              ),

              const SizedBox(height: 20),
              Row (
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [ Text("$_res", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),]
              ),
            ],
          ),
        ),
      )
    );
  }

}

