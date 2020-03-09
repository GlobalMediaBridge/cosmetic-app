import 'package:flutter/material.dart';
import 'package:cosmetic_app/utils/values/values.dart';

class NextButton extends StatelessWidget {
  Function buttonPressed;
  NextButton({@required this.buttonPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => this.buttonPressed(context),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      textColor: Color.fromARGB(255, 247, 7, 70),
      child: Text(
        "다음",
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
