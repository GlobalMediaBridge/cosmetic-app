import 'package:flutter/material.dart';

class Palette with ChangeNotifier {
  String id = "";
  List<Color> colors = [];

  void setId(String id) {
    this.id = id;
    notifyListeners();
  }

  String getId() {
    return this.id;
  }

  void addColor(Color color) {
    colors.add(color);
    notifyListeners();
  }

  Color getColor(int index) {
    return colors.elementAt(index);
  }


}