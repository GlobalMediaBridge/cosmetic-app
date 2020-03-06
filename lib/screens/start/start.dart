
import 'package:cosmetic_app/screens/camera_color.dart';
import 'package:cosmetic_app/screens/start/start_animation1_element1.dart';
import 'package:cosmetic_app/screens/start/start_animation1_element2.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:cosmetic_app/screens/album.dart';
import 'package:cosmetic_app/screens/tutorial1/tutorial1.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class Start extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _StartState();
}


class _StartState extends State<Start> with TickerProviderStateMixin {
  AnimationController logoTextAnimationController;
  AnimationController buttongroupAnimationController;
  
  @override
  void initState() {
  
    super.initState();
    
    this.logoTextAnimationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    this.buttongroupAnimationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    
    this.startAnimationOne();
  }
  
  @override
  void dispose() {
  
    super.dispose();
    
    this.logoTextAnimationController.dispose();
    this.buttongroupAnimationController.dispose();
  }
  
  void onButtonTwoPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CameraColor()));
  }
  
  void onButtonThreePressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Album()));
  
  }
  
  void onButtonPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Tutorial1()));
  }
  
  void startAnimationOne() {
  
    this.logoTextAnimationController.forward();
    this.buttongroupAnimationController.forward();
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 247, 7, 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 230),
              child: StartWidgetAnimation1Element1(
                animationController: this.logoTextAnimationController,
                child: Text(
                    "logo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 254, 215, 2),
                      fontFamily: "Lobster 1.4",
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                  )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 28),
              child: StartWidgetAnimation1Element2(
                animationController: this.buttongroupAnimationController,
                child: Column(
                  children: [
                    Container(
                      width: 310,
                      height: 46,
                      child: FlatButton(
                        onPressed: () => this.onButtonTwoPressed(context),
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                        ),
                        textColor: Color.fromARGB(255, 247, 7, 70),
                        padding: EdgeInsets.all(0),
                        child: Text(
                          "시작하기",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "NanumBarunGothic",
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 310,
                      height: 46,
                      margin: EdgeInsets.only(top: 14),
                      child: FlatButton(
                        onPressed: () => this.onButtonThreePressed(context),
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                        ),
                        textColor: Color.fromARGB(255, 247, 7, 70),
                        padding: EdgeInsets.all(0),
                        child: Text(
                          "사진앨범",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "NanumBarunGothic",
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 310,
                      height: 46,
                      margin: EdgeInsets.only(top: 14),
                      child: FlatButton(
                        onPressed: () => this.onButtonPressed(context),
                        color: AppColors.primaryText,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                        ),
                        textColor: Color.fromARGB(255, 255, 255, 255),
                        padding: EdgeInsets.all(0),
                        child: Text(
                          "사용설명",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: "NanumBarunGothic",
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "© 2020 app name",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}