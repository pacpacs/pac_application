import 'package:flutter/material.dart';
import 'package:pac_app/model/UserModel.dart';

/**
 * 사용자 모델 활용한 Logic
 * 
 * @author 서윤경
 * @version 1.0
 * @date 2019.08.16
 */

class User {
  UserModel user;
  User({this.user});

  Widget getProfileImage(double radius) {

    if (user.profileImgPath == null) {
      return CircleAvatar(
          //backgroundColor: Colors.brown.shade800,
          radius: radius,
          backgroundImage: AssetImage('images/default_picture.png'));
    } else {
      return CircleAvatar(
        //backgroundColor: Colors.brown.shade800,
        radius: radius,
        backgroundImage: NetworkImage(user.profileImgPath),
      );
    }
  }
}
