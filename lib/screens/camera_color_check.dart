
import 'package:cosmetic_app/screens/camera_face.dart';
import 'package:cosmetic_app/screens/camera_color.dart';
import 'package:cosmetic_app/screens/color_select.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/material.dart';


class CameraColorCheck extends StatelessWidget {
  
  void onReturnPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => CameraColor()));
  
  }
  
  void onButtonPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => ColorSelect()));
  
  }

  @override
  Widget build(BuildContext context) {

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
                    height: 500,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Container(),
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
                                Text(
                                  "",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 55,
                          bottom: 52,
                          child: Text(
                            "취소",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 247, 7, 70),
                              fontFamily: "NanumBarunGothic",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
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
              bottom: 51,
              child: Image.asset(
                "assets/images/next_background.png",
                fit: BoxFit.none,
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
                    Text(
                      "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
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