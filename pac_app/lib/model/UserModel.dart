
import 'dart:collection';

/**
 * 사용자 Data Model
 * 
 * @author 서윤경
 * @version 1.0
 * @date 2019.08.16
 */

class UserModel {
  String id;
  String nickName;
  String password;
  String profileImgPath;

  UserModel({this.id, this.nickName, this.password, this.profileImgPath});

  Future get getImageUrl async {
    // Null check so our app isn't doing extra work.
    // If there's already an image, we don't need to get one.
    if (profileImgPath != null) {
      return;
    }
  }

  Map<String,String> toJson(){
    Map<String,String> userMap = new HashMap<String,String>();
    
    userMap.addAll({
      "userId":this.id,
      "password":this.password,
      "imgPath":this.profileImgPath,
      "nickName":this.nickName
    });
    return userMap;
  }
  factory UserModel.fromJson(Map<String,dynamic> json) {
      return UserModel(
        id: json['userId'],
        nickName:json['nickName'],
        profileImgPath: json['imgPath']
      );
  }
}
