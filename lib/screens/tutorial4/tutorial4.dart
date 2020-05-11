
import 'package:cosmetic_app/screens/start/start.dart';
import 'package:cosmetic_app/screens/tutorial4/tutorial4_animation1_element1.dart';
import 'package:cosmetic_app/screens/tutorial4/tutorial4_animation1_element2.dart';
import 'package:cosmetic_app/screens/tutorial4/tutorial4_animation1_element3.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class Tutorial4 extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _Tutorial4State();
}


class _Tutorial4State extends State<Tutorial4> with TickerProviderStateMixin {
  AnimationController titleTwoAnimationController;
  AnimationController maintextTextAnimationController;
  AnimationController selectlightfilterImageAnimationController;
  
  @override
  void initState() {
  
    super.initState();
    
    this.titleTwoAnimationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    this.maintextTextAnimationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    this.selectlightfilterImageAnimationController = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    
    this.startAnimationOne();
  }
  
  @override
  void dispose() {
  
    super.dispose();
    
    this.titleTwoAnimationController.dispose();
    this.maintextTextAnimationController.dispose();
    this.selectlightfilterImageAnimationController.dispose();
  }
  
  void startAnimationOne() {
  
    this.titleTwoAnimationController.forward();
    this.maintextTextAnimationController.forward();
    this.selectlightfilterImageAnimationController.forward();
  }

  void onItemPressed(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);

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
                margin: EdgeInsets.only(top: 60),
                child: Tutorial4WidgetAnimation1Element1(
                  animationController: this.titleTwoAnimationController,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Step 4.",
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontFamily: "Lobster",
                        fontWeight: FontWeight.w400,
                        fontSize: 32,
                          letterSpacing: 0.1
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 243,
                margin: EdgeInsets.only(top: 24),
                child: Tutorial4WidgetAnimation1Element2(
                  animationController: this.maintextTextAnimationController,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(text: "원하는 색상", style: TextStyle(
                        color: AppColors.accentText,
                        fontFamily: "NanumBarunGothic",
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        height: 1.21429,
                      ),
                          children:<TextSpan>[
                            TextSpan(text: "으로\n바꿔가면서 테스트!", style: TextStyle(
                              color: AppColors.accentText,
                              fontFamily: "NanumBarunGothic",
                              fontWeight: FontWeight.w300,
                              fontSize: 28,
                              height: 1.21429,
                            ),)
                          ])
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 280,
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
                            color: AppColors.primaryBackground,
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
                        child: Image.asset(
                          "assets/images/tuto04_01.png",
                          width: 252,
                          height:448,
                        ),
                      ),
                      Positioned(
                        top: 48,
                        child: Tutorial4WidgetAnimation1Element3(
                          animationController: this.selectlightfilterImageAnimationController,
                          child: Image.asset(
                            "assets/images/tuto04_02.png",
                            width: 252,
                            height:448,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}