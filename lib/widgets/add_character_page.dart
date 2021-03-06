import 'package:d_and_d/models/character.dart';
import 'package:d_and_d/persistency/shared_preferences_db.dart';
import 'package:d_and_d/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

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

  int idCounter = 0;

  final InputDecoration _formDecorationInt = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
    border: OutlineInputBorder(),
    hintText: '10',
  );

  final InputDecoration _formDecorationInt2 = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
    border: OutlineInputBorder(),
    hintText: '0',
  );

  int getNewID() {
    int id = DB.getNewCharacterId();
    return id;
  }

  @override
  Widget build(BuildContext context) {
    Character c1 = Character(
      name: "",
      id: getNewID(),
      weapons: [],
      armors: [],
      objects: [],
      spells: [],
    );
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
                      children: const [
                        Text(
                          "GENERAL INFORMATION",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
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
                                c1.level = 1;
                              } else if (int.parse(level) < 1 ||
                                  int.parse(level) > 20) {
                                return 'Level must be between 1 and 20';
                              } else {
                                c1.level = int.parse(level);
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '1',
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
                        const Text("Hit points: "),
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
                                c1.race = "Unknown";
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
                        const Text("Class(es): "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (characterClass) {
                              if (characterClass == null ||
                                  characterClass.isEmpty) {
                                c1.characterClass = " ";
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
                                c1.background = " ";
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
                        const Text("Alignment: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (alignment) {
                              if (alignment == null || alignment.isEmpty) {
                                c1.alignment = "N";
                              } else {
                                c1.looks = alignment;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'CN',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Looks: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (looks) {
                              if (looks == null || looks.isEmpty) {
                                c1.looks = " ";
                              } else {
                                c1.looks = looks;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: '6ft tall, blue eyes, red skin',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Personality traits: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (traits) {
                              if (traits == null || traits.isEmpty) {
                                c1.traits = " ";
                              } else {
                                c1.traits = traits;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Extroverted and friendly',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Ideals: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (ideals) {
                              if (ideals == null || ideals.isEmpty) {
                                c1.ideals = " ";
                              } else {
                                c1.ideals = ideals;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Always help if you can',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Bonds: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (bonds) {
                              if (bonds == null || bonds.isEmpty) {
                                c1.bonds = " ";
                              } else {
                                c1.bonds = bonds;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'My father is the King',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Flaws: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (flaws) {
                              if (flaws == null || flaws.isEmpty) {
                                c1.flaws = " ";
                              } else {
                                c1.flaws = flaws;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Naive',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Known Languages: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (languages) {
                              if (languages == null || languages.isEmpty) {
                                c1.languages = "";
                              } else {
                                c1.languages = languages;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Common, Elf and Celestial',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Abilities: "),
                        Flexible(
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: (abilities) {
                              if (abilities == null || abilities.isEmpty) {
                                c1.abilities = "";
                              } else {
                                c1.abilities = abilities;
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Hellish Resistance, Darkvision',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        SizedBox(width: 25),
                        Text(
                          "CHARACTERISTICS  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          " SAVING THROWS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Strength: "),
                                Text("Dexterity: "),
                                Text("Charisma: "),
                                Text("Wisdom: "),
                                Text("Intelligence: "),
                                Text("Constitution: "),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (strength) {
                                    if (strength == null || strength.isEmpty) {
                                      c1.characteristics!.strength = 3;
                                    } else if (int.parse(strength) < 3 ||
                                        int.parse(strength) > 18) {
                                      return '3 < strength < 18';
                                    } else {
                                      c1.characteristics!.strength =
                                          int.parse(strength);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (dexterity) {
                                    if (dexterity == null ||
                                        dexterity.isEmpty) {
                                      c1.characteristics!.dexterity = 3;
                                    } else if (int.parse(dexterity) < 3 ||
                                        int.parse(dexterity) > 18) {
                                      return 'Dexterity must be between 3 and 18';
                                    } else {
                                      c1.characteristics!.dexterity =
                                          int.parse(dexterity);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (charisma) {
                                    if (charisma == null || charisma.isEmpty) {
                                      c1.characteristics!.charisma = 3;
                                    } else if (int.parse(charisma) < 3 ||
                                        int.parse(charisma) > 18) {
                                      return 'Charisma must be between 3 and 18';
                                    } else {
                                      c1.characteristics!.charisma =
                                          int.parse(charisma);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (wisdom) {
                                    if (wisdom == null || wisdom.isEmpty) {
                                      c1.characteristics!.wisdom = 3;
                                    } else if (int.parse(wisdom) < 3 ||
                                        int.parse(wisdom) > 18) {
                                      return 'Wisdom must be between 3 and 18';
                                    } else {
                                      c1.characteristics!.wisdom =
                                          int.parse(wisdom);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (intelligence) {
                                    if (intelligence == null ||
                                        intelligence.isEmpty) {
                                      c1.characteristics!.intelligence = 3;
                                    } else if (int.parse(intelligence) < 3 ||
                                        int.parse(intelligence) > 18) {
                                      return 'Intelligence must be between 3 and 18';
                                    } else {
                                      c1.characteristics!.intelligence =
                                          int.parse(intelligence);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (constitution) {
                                    if (constitution == null ||
                                        constitution.isEmpty) {
                                      c1.characteristics!.constitution = 3;
                                    } else if (int.parse(constitution) < 3 ||
                                        int.parse(constitution) > 18) {
                                      return 'Constitution must be between 3 and 18';
                                    } else {
                                      c1.characteristics!.constitution =
                                          int.parse(constitution);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                          ////////////////////////////////////////////////////////////////////////////////
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (strengthST) {
                                    if (strengthST == null ||
                                        strengthST.isEmpty) {
                                      c1.savingThrows!.strength = 0;
                                    } else {
                                      c1.savingThrows!.strength =
                                          int.parse(strengthST);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (dexterityST) {
                                    if (dexterityST == null ||
                                        dexterityST.isEmpty) {
                                      c1.savingThrows!.dexterity = 0;
                                    } else {
                                      c1.savingThrows!.dexterity =
                                          int.parse(dexterityST);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (charismaST) {
                                    if (charismaST == null ||
                                        charismaST.isEmpty) {
                                      c1.savingThrows!.charisma = 0;
                                    } else {
                                      c1.savingThrows!.charisma =
                                          int.parse(charismaST);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (wisdomST) {
                                    if (wisdomST == null || wisdomST.isEmpty) {
                                      c1.savingThrows!.wisdom = 0;
                                    } else {
                                      c1.savingThrows!.wisdom =
                                          int.parse(wisdomST);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
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
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 100,
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
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    Row(
                      children: const [
                        Text(
                          "SKILLS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 350,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Athletics: "),
                                Text("Acrobatics: "),
                                Text("Sleight Of Hand: "),
                                Text("Stealth: "),
                                Text("Arcana: "),
                                Text("History: "),
                                Text("Investigation: "),
                                Text("Nature: "),
                                Text("Religion: "),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (athletics) {
                                    if (athletics == null ||
                                        athletics.isEmpty) {
                                      c1.skills!.athletics = 0;
                                    } else {
                                      c1.skills!.athletics =
                                          int.parse(athletics);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (acrobatics) {
                                    if (acrobatics == null ||
                                        acrobatics.isEmpty) {
                                      c1.skills!.acrobatics = 0;
                                    } else {
                                      c1.skills!.acrobatics =
                                          int.parse(acrobatics);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (sleightOfHand) {
                                    if (sleightOfHand == null ||
                                        sleightOfHand.isEmpty) {
                                      c1.skills!.sleightOfHand = 0;
                                    } else {
                                      c1.skills!.sleightOfHand =
                                          int.parse(sleightOfHand);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (stealth) {
                                    if (stealth == null || stealth.isEmpty) {
                                      c1.skills!.stealth = 0;
                                    } else {
                                      c1.skills!.stealth = int.parse(stealth);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (arcana) {
                                    if (arcana == null || arcana.isEmpty) {
                                      c1.skills!.arcana = 0;
                                    } else {
                                      c1.skills!.arcana = int.parse(arcana);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (history) {
                                    if (history == null || history.isEmpty) {
                                      c1.skills!.history = 0;
                                    } else {
                                      c1.skills!.history = int.parse(history);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (investigation) {
                                    if (investigation == null ||
                                        investigation.isEmpty) {
                                      c1.skills!.investigation = 0;
                                    } else {
                                      c1.skills!.investigation =
                                          int.parse(investigation);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (nature) {
                                    if (nature == null || nature.isEmpty) {
                                      c1.skills!.nature = 0;
                                    } else {
                                      c1.skills!.nature = int.parse(nature);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (religion) {
                                    if (religion == null || religion.isEmpty) {
                                      c1.skills!.religion = 0;
                                    } else {
                                      c1.skills!.religion = int.parse(religion);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                          SizedBox(
                            height: 350,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Animal Handling: "),
                                Text("Insight: "),
                                Text("Medicine: "),
                                Text("Perception: "),
                                Text("Survival: "),
                                Text("Deception: "),
                                Text("Intimidation: "),
                                Text("Performance: "),
                                Text("Persuasion: "),
                              ],
                            ),
                          ),
                          ////////////////////////////////////////////////////////////////////////////////
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (animalHandling) {
                                    if (animalHandling == null ||
                                        animalHandling.isEmpty) {
                                      c1.skills!.animalHandling = 0;
                                    } else {
                                      c1.skills!.animalHandling =
                                          int.parse(animalHandling);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (insight) {
                                    if (insight == null || insight.isEmpty) {
                                      c1.skills!.insight = 0;
                                    } else {
                                      c1.skills!.insight = int.parse(insight);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (medicine) {
                                    if (medicine == null || medicine.isEmpty) {
                                      c1.skills!.medicine = 0;
                                    } else {
                                      c1.skills!.medicine = int.parse(medicine);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (perception) {
                                    if (perception == null ||
                                        perception.isEmpty) {
                                      c1.skills!.perception = 0;
                                    } else {
                                      c1.skills!.perception =
                                          int.parse(perception);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (survival) {
                                    if (survival == null || survival.isEmpty) {
                                      c1.skills!.survival = 0;
                                    } else {
                                      c1.skills!.survival = int.parse(survival);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (deception) {
                                    if (deception == null ||
                                        deception.isEmpty) {
                                      c1.skills!.deception = 0;
                                    } else {
                                      c1.skills!.deception =
                                          int.parse(deception);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (intimidation) {
                                    if (intimidation == null ||
                                        intimidation.isEmpty) {
                                      c1.skills!.intimidation = 0;
                                    } else {
                                      c1.skills!.intimidation =
                                          int.parse(intimidation);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (performance) {
                                    if (performance == null ||
                                        performance.isEmpty) {
                                      c1.skills!.performance = 0;
                                    } else {
                                      c1.skills!.performance =
                                          int.parse(performance);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 34,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  keyboardType: TextInputType.number,
                                  validator: (persuasion) {
                                    if (persuasion == null ||
                                        persuasion.isEmpty) {
                                      c1.skills!.persuasion = 0;
                                    } else {
                                      c1.skills!.persuasion =
                                          int.parse(persuasion);
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: _formDecorationInt2,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            DB.addCharacter(c1);
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/", (Route<dynamic> route) => false);
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
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
