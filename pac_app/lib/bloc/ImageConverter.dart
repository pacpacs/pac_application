
/**
 * 이미지 관련 받아오고 업로드 로직 
 * ImageConverter
 * 
 * @author 서윤경
 * @version 1.0
 * @date 2019.08.26
 */

import 'dart:convert';
import 'dart:io';

class ImageConverter{
  ImageConverter();
  static String getEncodeImageFile(File file){
    return  base64Encode(file.readAsBytesSync());
  }
  static String getImageFileName(File file){
    return file.path.split("/").last;  
  }
}