import 'package:flutter/cupertino.dart';

import '../constants.dart';

class ButtonForCalculate extends StatelessWidget {
  final VoidCallback functionOnTap;
  final String text;

  ButtonForCalculate(this.functionOnTap, this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: functionOnTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kBottomTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
