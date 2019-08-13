import 'package:flutter/material.dart';
import 'package:pac_app/model/UserModel.dart';

class User {
  UserModel user;
  User({this.user});

  Widget getProfileImage(double radius) {
    print(user.profileImgPath);
    return CircleAvatar(
      //backgroundColor: Colors.brown.shade800,
      radius: radius,
      backgroundImage: NetworkImage(user.profileImgPath),
    );
  }
}
