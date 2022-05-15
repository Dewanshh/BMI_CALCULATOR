import 'package:bmicalculator/const.dart';
import 'package:bmicalculator/input_page.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'calculatorbrain.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiresult,
      required this.resultText,
      required this.getTips});
  String bmiresult;
  String resultText;
  String getTips;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Your Result',
                style: slide,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: new ReusableWidget(
                colour: activatecolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiresult,
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 5),
                    ),
                    Text(
                      resultText,
                      style: slide,
                    ),
                    Text(
                      getTips,
                      textAlign: TextAlign.center,
                      style: lr,
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Center(
              child: Container(
                color: Colors.teal,
                height: 80,
                child: Center(
                  child: Text(
                    'Re-Calculate BMI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
