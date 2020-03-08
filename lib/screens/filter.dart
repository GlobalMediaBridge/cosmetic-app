import 'dart:io';

import 'package:cosmetic_app/screens/start/start.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  File preview;

  Filter({this.preview});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool showOrigin = false;

  void onButtonThreePressed(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void onButtonTwoPressed(BuildContext context) {}

  void onButtonPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.file(widget.preview,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 3 * 4),
                GestureDetector(
                    onLongPressStart: (LongPressStartDetails detail) {
                      print("누르기 시작");
                      setState(() {
                        showOrigin = true;
                      });
                    },
                    onLongPressEnd: (LongPressEndDetails detail) {
                      print("누르기 끝");
                      setState(() {
                        showOrigin = false;
                      });
                    },
                    child: showOrigin
                        ? Image.file(widget.preview,
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 3 * 4)
                        : Image.file(widget.preview,
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 3 * 4)),
                Positioned(
                  top: 24,
                  right: 19,
                  child: FlatButton(
                    onPressed: () => this.onButtonThreePressed(context),
                    color: AppColors.primaryText,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "저장",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "NanumBarunGothic",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
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
                    top: 22,
                    right: 25,
                    bottom: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 188,
                                  height: 55,
                                  child: FlatButton(
                                    onPressed: () =>
                                        this.onButtonPressed(context),
                                    color: AppColors.secondaryBackground,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                    ),
                                    textColor:
                                        Color.fromARGB(255, 154, 154, 155),
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      "컬러",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 154, 154, 155),
                                        fontFamily: "NanumBarunGothic",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 188,
                                  height: 55,
                                  child: FlatButton(
                                    onPressed: () =>
                                        this.onButtonTwoPressed(context),
                                    color: AppColors.secondaryBackground,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0)),
                                    ),
                                    textColor:
                                        Color.fromARGB(255, 154, 154, 155),
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      "필터",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 154, 154, 155),
                                        fontFamily: "NanumBarunGothic",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
