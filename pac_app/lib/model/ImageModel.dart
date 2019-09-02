import 'dart:collection';

class ImageModel {
  String base64Image;
  String fileName;
  String tag;

  ImageModel(
      {this.base64Image,this.fileName,this.tag});

Map<String,String> toJson(){
    Map<String,String> imageModelMap = new HashMap<String,String>();
    
    imageModelMap.addAll({
      "base64Image":this.base64Image,
      "fileName":this.fileName,
      "tag":this.tag
    });
    return imageModelMap;
  }

  factory ImageModel.fromJson(Map<String,dynamic> json) {
      return ImageModel(
        base64Image: json['base64Image'],
        fileName:json['fileName'],
        tag: json['tag']
      );
  }
 
}
