import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/material.dart';

class ColorAddButton extends StatelessWidget {
  Function addColor;
  ColorAddButton({@required this.addColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => addColor(context),
      child: Text(
        "+",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "NanumBarunGothic",
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
    );
  }
}
