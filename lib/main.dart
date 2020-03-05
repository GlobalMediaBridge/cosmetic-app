
import 'package:cosmetic_app/camera_color/camera_color.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: CameraColor(),
    );
  }
}