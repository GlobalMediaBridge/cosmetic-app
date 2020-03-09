import 'dart:io';

import 'package:cosmetic_app/store/palette.dart';
import 'package:cosmetic_app/store/server.dart';
import 'package:cosmetic_app/utils/values/values.dart';
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

  Widget _buildColorList(BuildContext context, Palette palette) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      Color color = palette.getColor(i);
      list.add(GestureDetector(
        onTap: () {
          String id = Provider.of<Palette>(context, listen: false).getId();
          Server.makeup(id, color).then((value) {
            setState(() {
              url =
                  "${Server.url}/image/${Provider.of<Palette>(context).getId()}/${color.value}";
            });
          });
        },
        child: Container(
          height: MediaQuery.of(context).size.width / 5.toInt(),
          width: MediaQuery.of(context).size.width / 6.toInt(),
          decoration: BoxDecoration(
            color: color == null ? Color.fromARGB(255, 174, 174, 174) : color,
            borderRadius: Radii.k5pxRadius,
          ),
          child: Container(),
        ),
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
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 25, right: 25, bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 30,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              child: TabMenu(
                                  text: '컬러',
                                  isActive: !colorFilter,
                                  tabToggle: () {
                                    setState(() {
                                      colorFilter = false;
                                    });
                                  })),
                          Expanded(
                              child: TabMenu(
                                  text: '필터',
                                  isActive: colorFilter,
                                  tabToggle: () {
                                    setState(() {
                                      colorFilter = true;
                                    });
                                  }))
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                        child: Consumer<Palette>(
                            builder: (context, value, child) =>
                                _buildColorList(context, value))),
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
