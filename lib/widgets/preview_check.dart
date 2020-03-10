import 'package:flutter/material.dart';

class PreviewCheck extends StatelessWidget {
  Function backPressed, confirmPressed;
  PreviewCheck({@required this.backPressed, @required this.confirmPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () => backPressed(context),
          child: Image.asset(
            "assets/images/back.png",
          ),
        ),
        FlatButton(
          onPressed: () => confirmPressed(context),
          child: Image.asset(
            "assets/images/next.png",
          ),
        ),
        FlatButton(
          child: Opacity(
            opacity: 0,
            child: Image.asset(
              "assets/images/next.png",
            ),
          ),
        )
      ],
    );
  }
}
