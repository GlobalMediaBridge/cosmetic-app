
import 'package:cosmetic_app/tutorial3_widget/tutorial3_widget_animation1_element1.dart';
import 'package:cosmetic_app/tutorial3_widget/tutorial3_widget_animation1_element2.dart';
import 'package:cosmetic_app/tutorial3_widget/tutorial3_widget_animation1_element3.dart';
import 'package:cosmetic_app/values/values.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class Tutorial3Widget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _Tutorial3WidgetState();
}


class _Tutorial3WidgetState extends State<Tutorial3Widget> with TickerProviderStateMixin {
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
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            Container(
              width: 147,
              height: 26,
              margin: EdgeInsets.only(top: 60),
              child: Tutorial3WidgetAnimation1Element1(
                animationController: this.titleTwoAnimationController,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: -2,
                      child: Opacity(
                        opacity: 0.5,
                        child: Container(
                          width: 180,
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
                              "Step 3.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
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
                              "필터 선택하기",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
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
              width: 243,
              margin: EdgeInsets.only(top: 24),
              child: Tutorial3WidgetAnimation1Element2(
                animationController: this.maintextTextAnimationController,
                child: Text(
                  "장소에 따라\n바뀌는 색감을 확인",
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
            Spacer(),
            Container(
              width: 280,
              height: 522,
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
                    bottom: 26,
                    child: Image.asset(
                      "assets/images/iphone-6-7-8--153x.png",
                      fit: BoxFit.none,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Tutorial3WidgetAnimation1Element3(
                      animationController: this.selectlightfilterImageAnimationController,
                      child: Image.asset(
                        "assets/images/iphone-6-7-8--163x.png",
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
    );
  }
}