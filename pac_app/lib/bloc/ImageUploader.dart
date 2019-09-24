import 'dart:convert';

/**
 * 이미지 관련 받아오고 업로드 로직 
 * ImageConverter
 * 
 * @author 서윤경
 * @version 1.0
 * @date 2019.08.26
 */

import 'package:http/http.dart' as http;

import 'package:pac_app/model/ImageModel.dart';

class ImageUploader {
  ImageUploader();

  static Future<ImageModel> upload(ImageModel imageModel) async {
    ImageModel tmpImageModel;

    // var res = await http.post('http://192.168.0.57:8080/image/upload',
    //     body: imageModel.toJson());
var res = await http.post('http://211.221.212.72:8080/image/upload',
        body: imageModel.toJson());
    if (res.statusCode == 200) {
      tmpImageModel = ImageModel.fromJson(json.decode(res.body));
    }

    return tmpImageModel;
  }
}
