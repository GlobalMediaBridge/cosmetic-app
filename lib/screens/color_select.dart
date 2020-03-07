import 'dart:io';

import 'package:cosmetic_app/screens/camera_face.dart';
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
  bool next = false;
  Color nowColor;

  void onNextPressed(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => CameraFace()));
  }

  Widget _buildColorList(BuildContext context, Palette palette) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      Color color = palette.getColor(i);
      list.add(Container(
        height: MediaQuery.of(context).size.width / 5.toInt(),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.file(widget.preview),
                GestureDetector(
                    onTapUp: (TapUpDetails details) async {
                      Color color = await Server.extractColor(
                          Provider.of<Palette>(context, listen: false).getId(),
                          details.localPosition.dx.toInt(),
                          details.localPosition.dy.toInt(),
                          MediaQuery.of(context).size.width.toInt());

                      setState(() {
                        showArea = true;
                        nowColor = color;
                      });
                    },
                    child: showArea
                        ? Image.network(
                            "${Server.url}/area/${Provider.of<Palette>(context).getId()}/${nowColor.value}")
                        : Image.file(widget.preview)),
                Positioned(
                  top: 24,
                  right: 19,
                  child: next
                      ? FlatButton(
                          onPressed: () => this.onNextPressed(context),
                          color: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          textColor: Color.fromARGB(255, 247, 7, 70),
                          padding: EdgeInsets.all(0),
                          child: Text(
                            "다음",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "NanumBarunGothic",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : Container(
                          width: 330,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(128, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Center(
                            child: Text(
                              showArea
                                  ? "+ 버튼을 눌러 색상을 추가해주세요"
                                  : "화장품 발색 영역을 선택해주세요.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "NanumBarunGothic",
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
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
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                    content: Text("화장품 발색 영역을 선택해주세요.")),
                              );
                              return;
                            }
                            if (Provider.of<Palette>(context, listen: false)
                                    .colors
                                    .length ==
                                5) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                    content: Text("최대 5개 까지 선택할 수 있습니다.")),
                              );
                              return;
                            }
                            Provider.of<Palette>(context, listen: false)
                                .addColor(nowColor);
                            setState(() {
                              nowColor = null;
                              showArea = false;
                              next = true;
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
            ),
          ],
        ),
      ),
    );
  }
}
