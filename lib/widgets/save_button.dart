import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  Function buttonPressed;
  SaveButton({@required buttonPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => buttonPressed(context),
      color: AppColors.primaryText,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        "저장",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "NanumBarunGothic",
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
