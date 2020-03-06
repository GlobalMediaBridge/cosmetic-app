import 'dart:async';

import 'package:cosmetic_app/screens/splash/splash_fadeout.dart';
import 'package:cosmetic_app/screens/splash/splash_fadein.dart';
import 'package:cosmetic_app/screens/start/start.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController logoTextAnimationController;
  AnimationController findyourcolorTextAnimationController;

  @override
  void initState() {
    super.initState();

    this.logoTextAnimationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    this.findyourcolorTextAnimationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    this.startAnimation();
  }

  @override
  void dispose() {
    super.dispose();

    this.logoTextAnimationController.dispose();
    this.findyourcolorTextAnimationController.dispose();
  }

  void startAnimation() {
    this.logoTextAnimationController.forward();
    this.findyourcolorTextAnimationController.forward();
    Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Start()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 247, 7, 70),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Opacity(
                opacity: 1,
                child: SplashFadeOut(
                  animationController:
                      this.findyourcolorTextAnimationController,
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
            Center(
              child: SplashFadeIn(
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
