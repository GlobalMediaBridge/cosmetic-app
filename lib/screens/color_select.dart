import 'dart:io';

import 'package:cosmetic_app/store/palette.dart';
import 'package:cosmetic_app/store/server.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:cosmetic_app/widgets/color_add_button.dart';
import 'package:cosmetic_app/widgets/help_box.dart';
import 'package:cosmetic_app/widgets/next_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cosmetic_app/screens/camera_view.dart';
import 'package:flutter/services.dart';

class ColorSelect extends StatefulWidget {
  File preview;

  ColorSelect({@required this.preview});

  @override
  _ColorSelectState createState() => _ColorSelectState();
}

class _ColorSelectState extends State<ColorSelect> {
  bool showArea = false;
  bool next = false;
  Color nowColor;

  void nextPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => CameraView(purpose: "face")));
  }

  Widget _buildColorList(BuildContext context, Palette palette) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      Color color = palette.getColor(i);
      list.add(Container(
        height: MediaQuery.of(context).size.width / 4.toInt(),
        width: MediaQuery.of(context).size.width / 25 * 4.toInt(),
        decoration: BoxDecoration(
          color: color == null ? Color.fromARGB(255, 229, 229, 229) : color,
          borderRadius: Radii.k5pxRadius,
        ),
        child: Container(),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  void showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(content: Text(message)),
    );
  }

  int getColorLength(BuildContext context) {
    return Provider.of<Palette>(context, listen: false).colors.length;
  }

  void addColor(BuildContext context) {
    if (nowColor == null) {
      showAlert("화장품 발색 영역을 선택해주세요.");
      return;
    }
    if (isExceed(getColorLength(context), 5)) {
      showAlert("최대 5개 까지 선택할 수 있습니다.");
      return;
    }
    Provider.of<Palette>(context, listen: false).addColor(nowColor);
    setState(() {
      nowColor = null;
      showArea = false;
      next = true;
    });
  }

  bool isExceed(int length, int expect) {
    return length >= expect;
  }

  void selectColor(BuildContext context, int x, int y, int width) async {
    Color color = await Server.extractColor(
        Provider.of<Palette>(context, listen: false).getId(), x, y, width);

    setState(() {
      showArea = true;
      nowColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 70),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.file(widget.preview,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 3 * 4),
                GestureDetector(
                    onTapUp: (TapUpDetails details) {
                      selectColor(
                          context,
                          details.localPosition.dx.toInt(),
                          details.localPosition.dy.toInt(),
                          MediaQuery.of(context).size.width.toInt());
                    },
                    child: showArea
                        ? Image.network(
                            "${Server.url}/area/${Provider.of<Palette>(context).getId()}/${nowColor.value}",
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 3 * 4)
                        : Image.file(widget.preview,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 3 * 4)),
                Positioned(
                  top: 24,
                  right: next ? 19 : null,
                  child: next
                      ? NextButton(buttonPressed: nextPressed)
                      : showArea
                          ? HelpBox(message: "+ 버튼을 눌러 색상을 추가해주세요")
                          : HelpBox(message: "화장품 발색 영역을 선택해주세요."),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 25, right: 25, bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Color Palette",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "NanumBarunGothic",
                            fontSize: 18,
                          ),
                        ),
                        ColorAddButton(addColor: addColor)
                      ],
                    ),
                    Spacer(),
                    Consumer<Palette>(
                        builder: (context, value, child) =>
                            _buildColorList(context, value))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
