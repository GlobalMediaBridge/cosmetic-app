import 'package:camera/camera.dart';
import 'package:cosmetic_app/screens/camera_color_check.dart';
import 'package:cosmetic_app/utils/values/camera.dart';
import 'package:flutter/material.dart';

class CameraColor extends StatefulWidget {
  CameraDescription camera;

  CameraColor() {
    camera = Camera().getBackCamera();
  }

  @override
  _CameraColorState createState() => _CameraColorState();
}

class _CameraColorState extends State<CameraColor> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onViewPressed(BuildContext context) {}

  void onButtonPressed(BuildContext context) {}

  void onButtonTwoPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => CameraColorCheck()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      AspectRatio(
                          aspectRatio: 3.0 / 4.0,
                          child: CameraPreview(_controller)),
                      Positioned(
                        top: 24,
                        child: Container(
                          alignment: Alignment.center,
                          width: 330,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(128, 255, 255, 255),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                          child: Text(
                            "손목 발색 사진을 촬영해주세요.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 247, 7, 70),
                              fontFamily: "NanumBarunGothic",
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: FlatButton(
                            onPressed: () => this.onViewPressed(context),
                          ),
                        ),
                        FlatButton(
                          onPressed: () => this.onButtonTwoPressed(context),
                          child: Image.asset(
                            "assets/images/camera_main.png",
                          ),
                        ),
                        FlatButton(
                            onPressed: () => this.onButtonPressed(context),
                            child: Image.asset(
                              "assets/images/lotation.png",
                            )),
                      ],
                    ),
                  ))
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
