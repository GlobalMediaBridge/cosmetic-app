import 'package:cosmetic_app/screens/splash/splash.dart';
import 'package:cosmetic_app/store/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<Palette>(
          create: (context) => Palette(), child: Splash()),
    );
  }
}
