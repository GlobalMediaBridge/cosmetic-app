import 'dart:io';

import 'package:cosmetic_app/screens/camera_view.dart';
import 'package:cosmetic_app/screens/color_select.dart';
import 'package:cosmetic_app/screens/filter.dart';
import 'package:cosmetic_app/store/palette.dart';
import 'package:cosmetic_app/store/server.dart';
import 'package:cosmetic_app/utils/values/values.dart';
import 'package:cosmetic_app/widgets/preview_check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Preview extends StatelessWidget {
  File preview;
  String purpose;

  Preview({@required this.preview, @required this.purpose});

  void backPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void confirmPressed(BuildContext context) async {
    switch (purpose) {
      case 'color':
        String id = await Server.uploadPalette(preview);
        Provider.of<Palette>(context, listen: false).setId(id);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ColorSelect(preview: preview)));
        break;
      case 'face':
      default:
        String id = Provider.of<Palette>(context, listen: false).getId();
        Server.uploadFace(id, preview);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Filter(preview: preview)));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            constraints: BoxConstraints.expand(),
            child: Column(children: [
              Image.file(preview,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 3 * 4),
              Expanded(
                  child: PreviewCheck(
                backPressed: backPressed,
                confirmPressed: confirmPressed,
              ))
            ])));
  }
}
