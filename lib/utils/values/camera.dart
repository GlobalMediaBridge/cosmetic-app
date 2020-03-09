import 'package:camera/camera.dart';

class Camera {
  static final Camera _instance = Camera._internal();
  CameraDescription _backCamera;
  CameraDescription _frontCamera;
  String selectedCamera = "back";

  factory Camera() {
    return _instance;
  }

  Camera._internal() {
    availableCameras().then((List<CameraDescription> cameraList){
      _backCamera = cameraList[0];
      _frontCamera = cameraList[1];
    });
  }

  CameraDescription getCamera() {
    switch(this.selectedCamera) {
      case 'front': return _frontCamera;
      case 'back':
      default: return _backCamera;
    }
  }

  CameraDescription switchCamera(){
    switch(this.selectedCamera) {
      case 'front' : this.selectedCamera = 'back'; return _backCamera;
      case 'back':
      default : this.selectedCamera = 'front'; return _frontCamera;
    }
  }

  CameraDescription getBackCamera(){
    this.selectedCamera = "back";
    return _backCamera;
  }

  CameraDescription getFrontCamera(){
    this.selectedCamera = "front";
    return _frontCamera;
  }


}
