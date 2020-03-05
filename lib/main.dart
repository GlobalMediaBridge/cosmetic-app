
import 'package:cosmetic_app/camera_face/camera_face.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: CameraFace(),
    );
  }
}