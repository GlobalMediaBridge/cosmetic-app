
import 'package:cosmetic_app/screens/tutorial1/tutorial1_animation1_element1.dart';
import 'package:cosmetic_app/screens/tutorial1/tutorial1_animation1_element2.dart';
import 'package:cosmetic_app/screens/tutorial1/tutorial1_animation1_element3.dart';
import 'package:cosmetic_app/screens/tutorial1/tutorial1_animation1_element4.dart';
import 'package:cosmetic_app/screens/tutorial2/tutorial2.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class Tutorial1 extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _Tutorial1State();
}


class _Tutorial1State extends State<Tutorial1> with TickerProviderStateMixin {
  AnimationController titleTwoAnimationController;
  AnimationController maintextTextAnimationController;
  AnimationController faceimageImageAnimationController;
  AnimationController colorimageImageAnimationController;
  
  @override
  void initState() {
  
    super.initState();
    
    this.titleTwoAnimationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    this.maintextTextAnimationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    this.faceimageImageAnimationController = AnimationController(duration: Duration(milliseconds: 2500), vsync: this);
    this.colorimageImageAnimationController = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    
    this.startAnimationOne();
  }
  
  @override
  void dispose() {
  
    super.dispose();
    
    this.titleTwoAnimationController.dispose();
    this.maintextTextAnimationController.dispose();
    this.faceimageImageAnimationController.dispose();
    this.colorimageImageAnimationController.dispose();
  }
  
  void startAnimationOne() {
  
    this.titleTwoAnimationController.forward();
    this.maintextTextAnimationController.forward();
    this.faceimageImageAnimationController.forward();
    this.colorimageImageAnimationController.forward();
  }

  void onItemPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Tutorial2()));

  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: GestureDetector(
        onTap: () => this.onItemPressed(context),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            children: [
              Container(
                width: 116,
                height: 26,
                margin: EdgeInsets.only(top: 60),
                child: Tutorial1WidgetAnimation1Element1(
                  animationController: this.titleTwoAnimationController,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: -2,
                        child: Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: 153,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 254, 215, 2),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Step 1.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 247, 7, 70),
                                  fontFamily: "Lobster 1.4",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "사진 찍기",
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
              ),
              Container(
                width: 230,
                margin: EdgeInsets.only(top: 24),
                child: Tutorial1WidgetAnimation1Element2(
                  animationController: this.maintextTextAnimationController,
                  child: Text(
                    "손목 발색 사진과\n민낯 사진을 업로드!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.accentText,
                      fontFamily: "NanumBarunGothic",
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      height: 1.21429,
                    ),
                  ),
                ),
              ),
              Container(
                width: 280,
                height: 522,
                margin: EdgeInsets.only(top: 29),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 280,
                        height: 522,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 54, 54, 54),
                          boxShadow: [
                            Shadows.primaryShadow,
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      top: 48,
                      child: Container(
                        width: 252,
                        height: 448,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      top: 48,
                      child: Tutorial1WidgetAnimation1Element4(
                        animationController: this.colorimageImageAnimationController,
                        child: Image.asset(
                          "assets/images/screen_capture_1.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 48,
                      child: Tutorial1WidgetAnimation1Element3(
                        animationController: this.faceimageImageAnimationController,
                        child: Image.asset(
                          "assets/images/screen_capture_2.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}