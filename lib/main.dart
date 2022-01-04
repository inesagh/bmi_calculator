import 'package:bmi_calculator/screens/results.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(10, 14, 33, 0.1),
      100: Color.fromRGBO(10, 14, 33, 0.2),
      200: Color.fromRGBO(10, 14, 33, 0.3),
      300: Color.fromRGBO(10, 14, 33, 0.4),
      400: Color.fromRGBO(10, 14, 33, 0.5),
      500: Color.fromRGBO(10, 14, 33, 0.6),
      600: Color.fromRGBO(10, 14, 33, 0.7),
      700: Color.fromRGBO(10, 14, 33, 0.8),
      800: Color.fromRGBO(10, 14, 33, 0.9),
      900: Color.fromRGBO(10, 14, 33, 1),
    };
    MaterialColor customColor = MaterialColor(0xFF0A0E21, color);

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: customColor),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
      // routes: {
      //   '\\': (context) => InputPage(),
      //   '\\result': (context) => Results('0', 'Normal', 'aaaa'),
      // },
    );
  }
}
