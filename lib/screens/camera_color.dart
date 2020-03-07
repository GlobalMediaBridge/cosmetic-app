import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cosmetic_app/screens/camera_color_check.dart';
import 'package:cosmetic_app/utils/values/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class CameraColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CameraView();
  }
}


class CameraView extends StatefulWidget {
  CameraDescription camera;

  CameraView() {
    camera = Camera().getBackCamera();
  }

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
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

  void openGallery(BuildContext context) async {
    try{
      File image = await ImagePicker.pickImage(
          source: ImageSource.gallery);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraColorCheck(preview: image),
        ),
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  void flip(BuildContext context) {
    setState(() {
      _controller =
          CameraController(Camera().switchCamera(), ResolutionPreset.medium);
      _initializeControllerFuture = _controller.initialize();
    });
  }

  void snapshot(BuildContext context) async {
    try {
      await _initializeControllerFuture;

      final String path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.jpg',
      );

      await _controller.takePicture(path);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraColorCheck(preview: File(path)),
        ),
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
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
                            onPressed: () => this.openGallery(context),
                          ),
                        ),
                        FlatButton(
                          onPressed: () => this.snapshot(context),
                          child: Image.asset(
                            "assets/images/camera_main.png",
                          ),
                        ),
                        FlatButton(
                            onPressed: () => this.flip(context),
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