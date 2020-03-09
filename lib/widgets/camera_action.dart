import 'package:flutter/material.dart';

class CameraAction extends StatelessWidget {
  Function openGallery, snapshot, flip;
  CameraAction({@required this.openGallery, @required this.snapshot, @required this.flip});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () => openGallery(context),
            child: Image.asset(
              "assets/images/album.png",
            ),
          ),
          FlatButton(
            onPressed: () => snapshot(context),
            child: Image.asset(
              "assets/images/camera_main.png",
            ),
          ),
          FlatButton(
              onPressed: () => flip(context),
              child: Image.asset(
                "assets/images/lotation.png",)
          ),
        ],
      ),
    );
  }
}
