import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:d_and_d/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

import 'characters_list_page.dart';

// Define a custom Form widget.
class AddCharacterPage extends StatefulWidget {
  const AddCharacterPage({Key? key}) : super(key: key);

  @override
  AddCharacterPageState createState() {
    return AddCharacterPageState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AddCharacterPageState extends State<AddCharacterPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Character c1 = Character(
      name: "",
      weapons: [],
      armors: [],
      objects: [],
      spells: [],
    );
    DB.setTest(false);
    // Build a Form widget using the _formKey created above.
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
        title: const Text("Create a character"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // Add TextFormFields and ElevatedButton here.
                    Row(
                      children: [
                        const Text("Name: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (name) {
                              if (name == null || name.isEmpty) {
                                return 'Please enter name';
                              } else {
                                c1.name = name;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Character Name",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Level: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (level) {
                              if (level == null || level.isEmpty) {
                                c1.level = 0;
                              } else if (int.parse(level) < 1 ||
                                  int.parse(level) > 20) {
                                return 'Level must be between 1 and 20';
                              } else {
                                c1.level = int.parse(level);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Armor: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (armor) {
                              if (armor == null || armor.isEmpty) {
                                c1.armor = 0;
                              } else if (int.parse(armor) < 0) {
                                return 'Armor must be positive';
                              } else {
                                c1.armor = int.parse(armor);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Initiative: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (initiative) {
                              if (initiative == null || initiative.isEmpty) {
                                c1.initiative = 0;
                              } else if (int.parse(initiative) < 0) {
                                return 'Initiative must be positive';
                              } else {
                                c1.initiative = int.parse(initiative);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Speed: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (speed) {
                              if (speed == null || speed.isEmpty) {
                                c1.speed = 0;
                              } else if (int.parse(speed) < 0) {
                                return 'Speed must be positive';
                              } else {
                                c1.speed = int.parse(speed);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Current hit points: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (currentHitPoints) {
                              if (currentHitPoints == null ||
                                  currentHitPoints.isEmpty) {
                                c1.currentHitPoints = 0;
                              } else if (int.parse(currentHitPoints) < 0) {
                                return 'Hit points must be positive';
                              } else {
                                c1.currentHitPoints =
                                    int.parse(currentHitPoints);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Race: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (race) {
                              if (race == null || race.isEmpty) {
                                c1.race = "Elf";
                              } else {
                                c1.race = race;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Elf',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Class: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (characterClass) {
                              if (characterClass == null ||
                                  characterClass.isEmpty) {
                                c1.characterClass = "Sorcerer";
                              } else {
                                c1.characterClass = characterClass;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Sorcerer',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Background: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (background) {
                              if (background == null || background.isEmpty) {
                                c1.background = "Gambler";
                              } else {
                                c1.background = background;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Gambler',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Strength: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (strength) {
                              if (strength == null || strength.isEmpty) {
                                c1.characteristics!.strength = 0;
                              } else if (int.parse(strength) < 3 ||
                                  int.parse(strength) > 18) {
                                return 'Level must be between 3 and 18';
                              } else {
                                c1.characteristics!.strength =
                                    int.parse(strength);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Dexterity: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (dexterity) {
                              if (dexterity == null || dexterity.isEmpty) {
                                c1.characteristics!.dexterity = 0;
                              } else if (int.parse(dexterity) < 3 ||
                                  int.parse(dexterity) > 18) {
                                return 'Dexterity must be between 3 and 18';
                              } else {
                                c1.characteristics!.dexterity =
                                    int.parse(dexterity);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Charisma: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (charisma) {
                              if (charisma == null || charisma.isEmpty) {
                                c1.characteristics!.charisma = 0;
                              } else if (int.parse(charisma) < 3 ||
                                  int.parse(charisma) > 18) {
                                return 'Charisma must be between 3 and 18';
                              } else {
                                c1.characteristics!.charisma =
                                    int.parse(charisma);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Wisdom: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (wisdom) {
                              if (wisdom == null || wisdom.isEmpty) {
                                c1.characteristics!.wisdom = 0;
                              } else if (int.parse(wisdom) < 3 ||
                                  int.parse(wisdom) > 18) {
                                return 'Wisdom must be between 3 and 18';
                              } else {
                                c1.characteristics!.wisdom = int.parse(wisdom);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Intelligence: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (intelligence) {
                              if (intelligence == null ||
                                  intelligence.isEmpty) {
                                c1.characteristics!.intelligence = 0;
                              } else if (int.parse(intelligence) < 3 ||
                                  int.parse(intelligence) > 18) {
                                return 'Intelligence must be between 3 and 18';
                              } else {
                                c1.characteristics!.intelligence =
                                    int.parse(intelligence);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Constitution: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (constitution) {
                              if (constitution == null ||
                                  constitution.isEmpty) {
                                c1.characteristics!.constitution = 0;
                              } else if (int.parse(constitution) < 3 ||
                                  int.parse(constitution) > 18) {
                                return 'Constitution must be between 3 and 18';
                              } else {
                                c1.characteristics!.constitution =
                                    int.parse(constitution);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Strength (Saving throws): "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (strengthST) {
                              if (strengthST == null || strengthST.isEmpty) {
                                c1.savingThrows!.strength = 0;
                              } else {
                                c1.savingThrows!.strength =
                                    int.parse(strengthST);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Dexterity (Saving Throws): "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (dexterityST) {
                              if (dexterityST == null || dexterityST.isEmpty) {
                                c1.savingThrows!.dexterity = 0;
                              } else {
                                c1.savingThrows!.dexterity =
                                    int.parse(dexterityST);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Charisma (Saving Throws): "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (charismaST) {
                              if (charismaST == null || charismaST.isEmpty) {
                                c1.savingThrows!.charisma = 0;
                              } else {
                                c1.savingThrows!.charisma =
                                    int.parse(charismaST);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Wisdom (Saving Throws): "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (wisdomST) {
                              if (wisdomST == null || wisdomST.isEmpty) {
                                c1.savingThrows!.wisdom = 0;
                              } else {
                                c1.savingThrows!.wisdom = int.parse(wisdomST);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Intelligence (Saving Throws): "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (intelligenceST) {
                              if (intelligenceST == null ||
                                  intelligenceST.isEmpty) {
                                c1.savingThrows!.intelligence = 0;
                              } else {
                                c1.savingThrows!.intelligence =
                                    int.parse(intelligenceST);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Constitution (Saving Throws): "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            keyboardType: TextInputType.number,
                            validator: (constitutionST) {
                              if (constitutionST == null ||
                                  constitutionST.isEmpty) {
                                c1.savingThrows!.constitution = 0;
                              } else {
                                c1.savingThrows!.constitution =
                                    int.parse(constitutionST);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // there exist a data in prefs
                            print("id character = " + c1.id.toString());
                            DB.addCharacter(c1);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharactersListPage(),
                              ),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                    Text(DB.getTest().toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
