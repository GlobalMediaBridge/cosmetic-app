
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
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ColorSelect(preview: preview)));
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),

          child: Column(

            children:[
              Image.file(preview),
              Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                  )

              )


            ]
          )


      )

    );

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Image.file(preview),
                  ),
                  Spacer(),
                  Container(
                    height: 167,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 167,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          bottom: 67,
                          child: FlatButton(
                            onPressed: () => this.onReturnPressed(context),
                            color: Color.fromARGB(0, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(0)),
                            ),
                            textColor: Color.fromARGB(255, 0, 0, 0),
                            padding: EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/back.png",),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 59,
              child: FlatButton(
                onPressed: () => this.onButtonPressed(context),
                color: Color.fromARGB(0, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                textColor: Color.fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/next.png",),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}