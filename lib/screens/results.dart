import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/button_for_calculate.dart';
import '../constants.dart';

class Results extends StatelessWidget {
  Results(this.bmi, this.result, this.interpretation);

  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, true);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    'Your Result',
                    style: kTitleTextStyle,
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(15),
                ),
              ),
              Expanded(
                flex: 5,
                child: ReusableCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          result.toUpperCase(),
                          style: kResultTextStyle,
                        ),
                        Text(
                          bmi,
                          style: kBMITextStyle,
                        ),
                        Text(
                          interpretation,
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    () {}),
              ),
              ButtonForCalculate(
                  (){
                    Navigator.pop(context, true);
                  },
                'RE-CALCULATE'
              ),
            ],
          ),
        ),
      ),
    );
  }

}

