import 'package:flutter/material.dart';

// Define a custom Form widget.
class CharacterForm extends StatefulWidget {
  const CharacterForm({Key? key}) : super(key: key);

  @override
  CharacterFormState createState() {
    return CharacterFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CharacterFormState extends State<CharacterForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.

          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (name) {
              if (name == null || name.isEmpty) {
                return 'Please enter name';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (level) {
              if (level == null || level.isEmpty) {
                return 'Please enter level';
              } else if (int.parse(level) < 1 || int.parse(level) > 20) {
                return 'Level must be between 1 and 20';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (armor) {
              if (armor == null || armor.isEmpty) {
                return 'Please enter armor';
              } else if (int.parse(armor) < 0) {
                return 'Armor must be positive';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (initiative) {
              if (initiative == null || initiative.isEmpty) {
                return 'Please enter initiative';
              } else if (int.parse(initiative) < 0) {
                return 'Initiative must be positive';
              }
              return null;
            },
          ),


          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (speed) {
              if (speed == null || speed.isEmpty) {
                return 'Please enter speed';
              } else if (int.parse(speed) < 0) {
                return 'Speed must be positive';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (currentHitPoints) {
              if (currentHitPoints == null || currentHitPoints.isEmpty) {
                return 'Please enter hit points';
              } else if (int.parse(currentHitPoints) < 0) {
                return 'Hit points must be positive';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (race) {
              if (race == null || race.isEmpty) {
                return 'Please enter race';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (characterClass) {
              if (characterClass == null || characterClass.isEmpty) {
                return 'Please enter class';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (background) {
              if (background == null || background.isEmpty) {
                return 'Please enter background';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (strength) {
              if (strength == null || strength.isEmpty) {
                return 'Please enter strength';
              } else if (int.parse(strength) < 3 || int.parse(strength) > 18) {
                return 'Level must be between 3 and 18';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (dexterity) {
              if (dexterity == null || dexterity.isEmpty) {
                return 'Please enter dexterity';
              } else if (int.parse(dexterity) < 3 || int.parse(dexterity) > 18) {
                return 'Dexterity must be between 3 and 18';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (charisma) {
              if (charisma == null || charisma.isEmpty) {
                return 'Please enter charisma';
              } else if (int.parse(charisma) < 3 || int.parse(charisma) > 18) {
                return 'Charisma must be between 3 and 18';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (wisdom) {
              if (wisdom == null || wisdom.isEmpty) {
                return 'Please enter wisdom';
              } else if (int.parse(wisdom) < 3 || int.parse(wisdom) > 18) {
                return 'Wisdom must be between 3 and 18';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (intelligence) {
              if (intelligence == null || intelligence.isEmpty) {
                return 'Please enter intelligence';
              } else if (int.parse(intelligence) < 3 || int.parse(intelligence) > 18) {
                return 'Intelligence must be between 3 and 18';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (constitution) {
              if (constitution == null || constitution.isEmpty) {
                return 'Please enter constitution';
              } else if (int.parse(constitution) < 3 || int.parse(constitution) > 18) {
                return 'Constitution must be between 3 and 18';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (strengthST) {
              if (strengthST == null || strengthST.isEmpty) {
                return 'Please enter strength saving throw';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (dexterityST) {
              if (dexterityST == null || dexterityST.isEmpty) {
                return 'Please enter dexterity saving throw';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (charismaST) {
              if (charismaST == null || charismaST.isEmpty) {
                return 'Please enter charisma saving throw';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (wisdomST) {
              if (wisdomST == null || wisdomST.isEmpty) {
                return 'Please enter wisdom saving throw';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (intelligenceST) {
              if (intelligenceST == null || intelligenceST.isEmpty) {
                return 'Please enter intelligence saving throw';
              }
              return null;
            },
          ),

          TextFormField(
            // The validator receives the text that the user has entered.
            keyboardType: TextInputType.number,
            validator: (constitutionST) {
              if (constitutionST == null || constitutionST.isEmpty) {
                return 'Please enter constitution saving throw';
              }
              return null;
            },
          ),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),

        ],
      ),
    );
  }
}