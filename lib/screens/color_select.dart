import 'dart:io';

import 'package:cosmetic_app/store/palette.dart';
import 'package:cosmetic_app/store/server.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class ColorSelect extends StatefulWidget {
  File preview;

  ColorSelect({@required this.preview});

  @override
  _ColorSelectState createState() => _ColorSelectState();
}

class _ColorSelectState extends State<ColorSelect> {
  bool showArea = false;
  Color nowColor;

  Widget _buildColorList(BuildContext context, Palette palette) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      Color color = palette.getColor(i);
      list.add(Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 6.toInt(),
        decoration: BoxDecoration(
          color: color == null ? Color.fromARGB(255, 174, 174, 174) : color,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 500,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                          onTapUp: (TapUpDetails details) async {
                            print('x: ${details.localPosition.dx.toInt()}');
                            print('y: ${details.localPosition.dy.toInt()}');
                            Color color = await Server.extractColor(
                                Provider.of<Palette>(context, listen: false)
                                    .getId(),
                                details.localPosition.dx.toInt(),
                                details.localPosition.dy.toInt(),
                                MediaQuery.of(context).size.width.toInt());

                            print('color: $color');
                            setState(() {
                              showArea = true;
                              nowColor = color;
                            });
                          },
                          child: showArea
                              ? Image.network(
                                  "${Server.url}/area/${Provider.of<Palette>(context).getId()}")
                              : Image.file(widget.preview))),
                  Positioned(
                    top: 24,
                    child: Container(
                      width: 330,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(128, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "화장품 발색 영역을 선택해주세요.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "NanumBarunGothic",
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 375,
                      height: 167,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 25,
                    right: 25,
                    bottom: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Color palette",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (nowColor == null) {
                                  print('선택하시오');
                                  return;
                                }
                                if (Provider.of<Palette>(context, listen: false)
                                        .colors
                                        .length ==
                                    5) {
                                  print('5개 까지만 된다');
                                  return;
                                }
                                Provider.of<Palette>(context, listen: false)
                                    .addColor(nowColor);
                                imageCache.clear();
                                setState(() {
                                  nowColor = null;
                                  showArea = false;
                                });
                              },
                              child: Text(
                                "+",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "NanumBarunGothic",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Consumer<Palette>(
                            builder: (context, value, child) =>
                                _buildColorList(context, value))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
