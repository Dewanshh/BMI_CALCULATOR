import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});
  final int height, weight;
  double _bmi = 0;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return '"Overweight"';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String gettips() {
    if (_bmi >= 25)
      return '\"Eat Less and Do Excersise\"';
    else if (_bmi > 18.5)
      return '\"Just Follow the Normal Routine\"';
    else
      return '\"Eat More and More\"';
  }
}
