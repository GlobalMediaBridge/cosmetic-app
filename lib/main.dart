
import 'package:cosmetic_app/screens/splash/splash.dart';
import 'package:cosmetic_app/screens/start/start.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: Start(),

    );
  }
}