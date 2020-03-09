import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cosmetic_app/screens/preview.dart';
import 'package:cosmetic_app/screens/camera_face_check.dart';
import 'package:cosmetic_app/utils/values/camera.dart';
import 'package:cosmetic_app/widgets/camera_action.dart';
import 'package:cosmetic_app/widgets/help_box.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraView extends StatefulWidget {
  CameraDescription camera;
  String purpose;
  String message;

  CameraView({@required this.purpose}) {
    switch (purpose) {
      case 'face':
        message = "민낯 사진을 촬영해 주세요.";
        camera = Camera().getFrontCamera();
        break;
      case 'color':
      default:
        message = "손목 발색 사진을 촬영해주세요.";
        camera = Camera().getBackCamera();
        break;
    }
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

  void showPreview(BuildContext context, File image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Preview(preview: image, purpose:widget.purpose)
      ),
    );
  }

  void openGallery(BuildContext context) async {
    try {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      showPreview(context, image);
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

      showPreview(context, File(path));
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
                          top: 24, child: HelpBox(message: widget.message)),
                    ],
                  ),
                  Expanded(
                      child: CameraAction(
                          openGallery: openGallery,
                          snapshot: this.snapshot,
                          flip: flip))
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
