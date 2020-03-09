import 'dart:io';

import 'package:cosmetic_app/store/palette.dart';
import 'package:cosmetic_app/store/server.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:cosmetic_app/widgets/color_filter_tab.dart';
import 'package:cosmetic_app/widgets/save_button.dart';
import 'package:cosmetic_app/widgets/tab_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filter extends StatefulWidget {
  File preview;

  Filter({this.preview});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool showOrigin = false;
  bool colorFilter = false;
  String url;

  void savePressed(BuildContext context) {
    // 앱 내부에 이미지 저장

    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void setUrl(String url) {
    setState((){
      this.url = url;
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
                        : url == null
                            ? Container()
                            : Image.network(url,
                                fit: BoxFit.fitWidth,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.width / 3 * 4)),
                Positioned(
                    top: 24,
                    right: 19,
                    child: SaveButton(buttonPressed: savePressed)),
              ],
            ),
            Expanded(
              child: ColorFilterTab(setUrl:setUrl)
            ),
          ],
        ),
      ),
    );
  }
}
