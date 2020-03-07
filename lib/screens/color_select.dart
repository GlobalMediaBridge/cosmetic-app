import 'dart:io';

import 'package:cosmetic_app/store/palette.dart';
import 'package:cosmetic_app/store/server.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorSelect extends StatelessWidget {
  File preview;

  ColorSelect({@required this.preview});

  void getColor({int x = 0, int y = 0}) {}

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
                            Color color = await Server.extractColor(
                                Provider.of<Palette>(context, listen: false).getId(),
                                details.localPosition.dx.toInt(),
                                details.localPosition.dy.toInt());
                            Provider.of<Palette>(context, listen: false).addColor(color);
                          },
                          child: Image.file(preview))),
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Color palette",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 81,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 174, 174, 174),
                                      borderRadius: Radii.k5pxRadius,
                                    ),
                                    child: Container(),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 81,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 174, 174, 174),
                                      borderRadius: Radii.k5pxRadius,
                                    ),
                                    child: Container(),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 81,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 174, 174, 174),
                                      borderRadius: Radii.k5pxRadius,
                                    ),
                                    child: Container(),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 81,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 174, 174, 174),
                                      borderRadius: Radii.k5pxRadius,
                                    ),
                                    child: Container(),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 81,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 174, 174, 174),
                                      borderRadius: Radii.k5pxRadius,
                                    ),
                                    child: Container(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
