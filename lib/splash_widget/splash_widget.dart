
import 'package:cosmetic_app/splash_widget/splash_widget_animation1_element1.dart';
import 'package:cosmetic_app/splash_widget/splash_widget_animation1_element2.dart';
import 'package:cosmetic_app/values/values.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class SplashWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _SplashWidgetState();
}


class _SplashWidgetState extends State<SplashWidget> with TickerProviderStateMixin {
  AnimationController logoTextAnimationController;
  AnimationController findyourcolorTextAnimationController;
  AnimationController LosQDQlNZMAnimationController;
  
  @override
  void initState() {
  
    super.initState();
    
    this.logoTextAnimationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    this.findyourcolorTextAnimationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    this.LosQDQlNZMAnimationController = AnimationController(duration: Duration(milliseconds: 0), vsync: this);
    
    this.startAnimationOne();
  }
  
  @override
  void dispose() {
  
    super.dispose();
    
    this.logoTextAnimationController.dispose();
    this.findyourcolorTextAnimationController.dispose();
    this.LosQDQlNZMAnimationController.dispose();
  }
  
  void startAnimationOne() {
  
    this.logoTextAnimationController.forward();
    this.findyourcolorTextAnimationController.forward();
    this.LosQDQlNZMAnimationController.forward();
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 247, 7, 70),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Opacity(
                opacity: 0,
                child: SplashWidgetAnimation1Element2(
                  animationController: this.findyourcolorTextAnimationController,
                  child: Text(
                    "Find your color!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 254, 215, 2),
                      fontFamily: "Lobster 1.4",
                      fontWeight: FontWeight.w400,
                      fontSize: 42,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: SplashWidgetAnimation1Element1(
                animationController: this.logoTextAnimationController,
                child: Text(
                  "logo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 254, 215, 2),
                    fontFamily: "Lobster 1.4",
                    fontWeight: FontWeight.w400,
                    fontSize: 42,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}