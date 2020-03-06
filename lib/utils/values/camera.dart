import 'package:camera/camera.dart';

class Camera {
  static final Camera _instance = Camera._internal();
  CameraDescription _backCamera;
  CameraDescription _frontCamera;

  factory Camera() {
    return _instance;
  }

  Camera._internal() {
    availableCameras().then((List<CameraDescription> cameraList){
      _backCamera = cameraList[0];
      _frontCamera = cameraList[1];
      print('=======================================');
      print('=======================================');
      print('=======================================');
      print('=======================================');
      print('=======================================');
      print('=======================================');
    });
  }

  CameraDescription getBackCamera(){
    return _backCamera;
  }

  CameraDescription getFrontCamera(){
    return _frontCamera;
  }

}
