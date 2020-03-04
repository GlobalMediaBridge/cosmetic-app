
import 'package:cosmetic_app/start_widget/start_widget_animation1_element1.dart';
import 'package:cosmetic_app/start_widget/start_widget_animation1_element2.dart';
import 'package:cosmetic_app/values/values.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class StartWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _StartWidgetState();
}


class _StartWidgetState extends State<StartWidget> with TickerProviderStateMixin {
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
  
  }
  
  void onButtonThreePressed(BuildContext context) {
  
  }
  
  void onButtonPressed(BuildContext context) {
  
  }
  
  void startAnimationOne() {
  
    this.logoTextAnimationController.forward();
    this.buttongroupAnimationController.forward();
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 247, 7, 70),
        ),
        child: Column(
          children: [
            StartWidgetAnimation1Element1(
              animationController: this.logoTextAnimationController,
              child: Text(
                "logo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 254, 215, 2),
                  fontFamily: "Lobster 1.4",
                  fontWeight: FontWeight.w400,
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              width: 367,
              height: 166,
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
                          textAlign: TextAlign.left,
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
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.14286,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}