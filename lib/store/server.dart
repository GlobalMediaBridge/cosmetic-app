import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Server {
  static final String url = "http://ec2-13-125-153-38.ap-northeast-2.compute.amazonaws.com:5000";
  static final Dio dio = Dio();

  static Future<String> uploadPalette(File image) async {
    FormData formData = FormData.fromMap({
      "image":
          await MultipartFile.fromFile(image.path, filename: 'palette.jpg'),
    });
    Response response = await dio.post("$url/palette", data: formData);
    return response.data.toString();
  }

  static Future<String> uploadFace(String id, File image) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path, filename: 'face.jpg'),
    });
    Response response = await dio.post(
      "$url/upload",
      data: formData,
      options: Options(
        headers: {"id": id},
      ),
    );
    return response.data.toString();
  }

  static Future<Color> extractColor(String id, int x, int y, int width) async {
    Response response = await dio.post(
      "$url/extract",
      data: {"x": x, "y": y, "width": width},
      options: Options(
        headers: {"id": id},
      ),
    );
    List<dynamic> data = response.data;
    Color color = Color.fromARGB(data[3].toInt(), data[2].toInt(), data[1].toInt(), data[0].toInt());
    return color;
  }

  static Future<String> makeup(String id, Color color) async {
    List<int> c = [color.blue, color.green, color.red, color.alpha];
    Response response = await dio.post(
      "$url/extract",
      data: {"color": c},
      options: Options(
        headers: {"id": id},
      ),
    );
    return response.data.toString();
  }
}
