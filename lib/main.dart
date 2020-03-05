
import 'package:cosmetic_app/camera_face_check/camera_face_check.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: CameraFaceCheck(),
    );
  }
}