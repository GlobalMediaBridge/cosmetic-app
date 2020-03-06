import 'dart:io';

import 'package:dio/dio.dart';

class Server {
  static final String url="http://localhost:5000";
  static final Dio dio = Dio();

  static Future<String> uploadPalette(File image) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path,
          filename: 'palette.jpg'),
    });
    Response response = await dio.post("$url/palette", data: formData);
    return response.data.toString();
  }

  static Future<String> uploadFace(File image) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path,
          filename: 'face.jpg'),
    });
    Response response = await dio.post("$url/upload", data: formData);
    return response.data.toString();
  }
}
