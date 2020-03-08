import 'dart:io';

import 'package:cosmetic_app/screens/camera_face.dart';
import 'package:cosmetic_app/screens/camera_color.dart';
import 'package:cosmetic_app/screens/color_select.dart';
import 'package:cosmetic_app/store/palette.dart';
import 'package:cosmetic_app/store/server.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraColorCheck extends StatelessWidget {
  File preview;

  CameraColorCheck({@required this.preview});

  void onReturnPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onButtonPressed(BuildContext context) async {
    String id = await Server.uploadPalette(preview);
    Provider.of<Palette>(context, listen: false).setId(id);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ColorSelect(preview: preview)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            constraints: BoxConstraints.expand(),
            child: Column(children: [
              Image.file(preview,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 3 * 4),
              Expanded(
                  child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => this.onReturnPressed(context),
                      child: Image.asset(
                        "assets/images/back.png",
                      ),
                    ),
                    FlatButton(
                      onPressed: () => this.onButtonPressed(context),
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
                ),
              ))
            ])));
  }
}
