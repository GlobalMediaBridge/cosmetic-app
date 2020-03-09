import 'package:flutter/material.dart';

class HelpBox extends StatelessWidget {
  String message;
  HelpBox({@required this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 330,
      height: 28,
      decoration: BoxDecoration(
        color: Color.fromARGB(128, 255, 255, 255),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 247, 7, 70),
          fontFamily: "NanumBarunGothic",
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }
}
