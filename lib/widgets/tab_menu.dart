import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/material.dart';

class TabMenu extends StatelessWidget {
  String text;
  bool isActive;
  Function tabToggle;

  TabMenu({@required this.text, @required this.isActive, @required this.tabToggle});



  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: tabToggle,
        color: AppColors.secondaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        padding: EdgeInsets.all(0),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: isActive
                ? AppColors.primaryText
                : Color.fromARGB(255, 154, 154, 155),
            fontFamily: "NanumBarunGothic",
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ));
  }
}
