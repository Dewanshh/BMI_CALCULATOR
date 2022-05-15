import 'package:bmicalculator/calculatorbrain.dart';
import 'package:bmicalculator/resultspage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender.dart';
import 'iconcontent.dart';
import 'const.dart';
import 'calculatorbrain.dart';

const bootomcontainerheight = 80.0;
const activatecolor = Color(0xFF1D1E33);
const bottomcolor = Color(0xFFEB1555);
const inactivecardcolor = Color(0xFF111328);

Color malecardcolour = inactivecardcolor;
Color femalecardcolour = inactivecardcolor;

int height = 180;

int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new ReusableWidget(
                    onPress: () {
                      setState(() {
                        updateColour(Sex.male);
                      });
                    },
                    colour: malecardcolour,
                    cardchild: Gender(iconn: FontAwesomeIcons.mars),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new ReusableWidget(
                    onPress: () {
                      setState(() {
                        updateColour(Sex.female);
                      });
                    },
                    colour: femalecardcolour,
                    cardchild: Gender(iconn: FontAwesomeIcons.venus),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new ReusableWidget(
                colour: inactivecardcolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: slide,
                        ),
                        Text(
                          'cm',
                          style: lr,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.teal,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double NewValue) {
                          setState(() {
                            height = NewValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new ReusableWidget(
                    colour: inactivecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: slide,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                }),
                            SizedBox(width: 10),
                            RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new ReusableWidget(
                    colour: inactivecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: slide,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            resultText: calc.calculateBMI(),
                            bmiresult: calc.getResult(),
                            getTips: calc.gettips(),
                          )));
            },
            child: Center(
              child: Container(
                color: Colors.teal,
                child: Center(
                  child: Text(
                    'Calculate Your BMI',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                width: double.infinity,
                height: 80,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  ReusableWidget({required this.colour, this.cardchild, this.onPress});
  final Color colour;
  final Widget? cardchild;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardchild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData? icon;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        elevation: 0.0,
        child: Icon(icon),
        constraints: BoxConstraints.tightFor(width: 56, height: 50),
        shape: CircleBorder(),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fillColor: Color(0xFF4C4F5E));
  }
}
