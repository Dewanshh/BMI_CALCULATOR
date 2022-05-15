import 'package:flutter/material.dart';
import 'input_page.dart';
import 'iconcontent.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText2: TextStyle(
              fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      home: InputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
