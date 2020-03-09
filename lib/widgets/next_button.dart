import 'package:flutter/material.dart';
import 'package:cosmetic_app/utils/values/values.dart';

class NextButton extends StatelessWidget {
  Function buttonPressed;
  NextButton({@required this.buttonPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => this.buttonPressed(context),
      color: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      textColor: Color.fromARGB(255, 247, 7, 70),
      padding: EdgeInsets.all(0),
      child: Text(
        "다음",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "NanumBarunGothic",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
