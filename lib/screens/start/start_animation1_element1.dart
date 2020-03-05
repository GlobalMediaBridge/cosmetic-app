
import 'dart:math';
import 'package:cosmetic_app/values/values.dart';
import 'package:flutter/widgets.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

Animation<double> _createTranslationYProperty(AnimationController animationController) => Interpolation<double>(keyframes: [
  Keyframe<double>(fraction: 0, value: 0),
  Keyframe<double>(fraction: 0.00001, value: 77),
  Keyframe<double>(fraction: 1, value: 0),
]).animate(CurvedAnimation(
  curve: Interval(0, 1, curve: Cubic(0, 0, 0.58, 1)),
  parent: animationController,
));


class StartWidgetAnimation1Element1 extends StatelessWidget {
  
  StartWidgetAnimation1Element1({
    Key key,
    this.child,
    @required AnimationController animationController
  }) : assert(animationController != null),
       this.translationY = _createTranslationYProperty(animationController),
       super(key: key);
  
  final Animation<double> translationY;
  final Widget child;
  
  
  @override
  Widget build(BuildContext context) {
  
    return AnimatedBuilder(
      animation: Listenable.merge([
        this.translationY,
      ]),
      child: this.child,
      builder: (context, widget) {
      
        return Transform.translate(
          offset: Offset(0, this.translationY.value),
          child: widget,
        );
      },
    );
  }
}