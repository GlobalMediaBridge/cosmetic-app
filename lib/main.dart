
import 'package:cosmetic_app/screens/album_select.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: AlbumSelect(),
    );
  }
}