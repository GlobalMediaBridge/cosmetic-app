import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class Camera with ChangeNotifier {
  CameraDescription backCamera;
  CameraDescription frontCamera;

  Camera() {
    availableCameras().then((List<CameraDescription> cameraList){
      backCamera = cameraList[0];
      frontCamera = cameraList[1];
      print('=======================================');
      print('=======================================');
      print('=======================================');
      print('=======================================');
      print('=======================================');
      print('=======================================');
    });
  }

  CameraDescription getBackCamera(){
    return backCamera;
  }

  CameraDescription getFrontCamera(){
    return frontCamera;
  }


}