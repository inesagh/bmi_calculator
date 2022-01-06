import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/button_for_calculate.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 0;
  int weight = 0;
  int age = 0;

  @override
  void initState() {
    super.initState();
    initProperties();
  }

  void initProperties() {
    setState(() {
      height = 50;
      weight = 40;
      age = 18;
    });
    print('initProperties');
  }

  @override
  void deactivate() {
    print('deactivate1');
    super.deactivate();
    print('deactivate2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        selectedGender == Gender.MALE
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        IconContent(FontAwesomeIcons.mars, 'MALE'), () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(
                        selectedGender == Gender.FEMALE
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        IconContent(FontAwesomeIcons.venus, 'FEMALE'), () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  kActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$height',
                            style: kNumberStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: kBottomContainerColor.withOpacity(0.16),
                          activeTrackColor: Colors.white,
                          thumbColor: kBottomContainerColor,
                          inactiveTrackColor: Colors.white30,
                        ),
                        child: Slider.adaptive(
                          value: height.toDouble(),
                          onChanged: (setHeight) {
                            setState(() {
                              height = setHeight.round();
                            });
                          },
                          min: 50,
                          max: 200,
                        ),
                      )
                    ],
                  ),
                  () {}),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              '$weight',
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                SizedBox(width: 10),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                              ],
                            )
                          ],
                        ),
                        () {}),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              '$age',
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                                SizedBox(width: 10),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                              ],
                            )
                          ],
                        ),
                        () {}),
                  ),
                ],
              ),
            ),
            ButtonForCalculate(
              () async {
                CalculatorBrain calc = CalculatorBrain(height, weight);
                // Navigator.pushNamed(context, '\\result', arguments: Results(calc.calculateBMI(), calc.getResult(), calc.getInterpretation()));
                var initialize = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(calc.calculateBMI(),
                        calc.getResult(), calc.getInterpretation()),
                  ),
                );
                if (initialize == true) {
                  initProperties();
                }
              },
              'BMI CALCULATOR',
            ),
          ],
        ),
      ),
    );
  }
}
