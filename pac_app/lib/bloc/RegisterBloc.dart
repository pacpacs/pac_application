import 'dart:convert';
import 'dart:io';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pac_app/bloc/ImageUploader.dart';
import 'package:pac_app/model/UserModel.dart';
import 'package:pac_app/model/ImageModel.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

import 'ImageConverter.dart';

/**
 * 회원가입 Register AuthBloc
 * 
 * @author 서윤경
 * @version 1.0
 * @date 2019.08.16
 */

class RegisterBloc implements Bloc {
  final _userIdToRegister = BehaviorSubject<String>();
  final _userPasswordToRegister = BehaviorSubject<String>();
  final _userNickNameToRegister = BehaviorSubject<String>();
  final _userImageFileToRegister = BehaviorSubject<File>();

  Stream<String> get userIdToRegister => _userIdToRegister.stream;
  Stream<String> get userPasswordToRegister => _userPasswordToRegister.stream;
  Stream<String> get userNickNameToRegister => _userNickNameToRegister.stream;
  Stream<File> get userImageFileToRegister => _userImageFileToRegister.stream;

  Function(String) get setUserIdToRegister => _userIdToRegister.sink.add;
  Function(String) get setUserPasswordToRegister =>
      _userPasswordToRegister.sink.add;
  Function(String) get setUserNickNameToRegister =>
      _userNickNameToRegister.sink.add;
  Function(File) get setUserImageFileToRegister =>
      _userImageFileToRegister.sink.add;

  Future<UserModel> fetchRegisterPost(UserModel validUser,ImageModel imageModel) async {
  

    print("register post start");
    var tmpImageModel = await ImageUploader.upload(imageModel);
    print(tmpImageModel.toString());
    if (tmpImageModel != null) {
      validUser.profileImgPath = tmpImageModel.fileName;

      var res = await http.post('http://192.168.0.57:8080/users/register',
          body: validUser.toJson());

      if (res.statusCode == 200) {
        print("register post end");
        debugPrint(res.body.toString());
      }
    }

    return validUser;
  }

  Future<UserModel> submit() async {
      File file = _userImageFileToRegister.value;
    if (file == null) return null;

    String filename = ImageConverter.getImageFileName(file);

    UserModel validUser = UserModel(
        id: _userIdToRegister.value,
        password: _userPasswordToRegister.value,
        nickName: _userNickNameToRegister.value,
        profileImgPath: filename); //서버이미지저장주소 + fileName

    print("validUser : " + validUser.id);

    ImageModel imageModel = ImageModel(
        fileName: filename,
        base64Image: ImageConverter.getEncodeImageFile(file),
        tag: "REGISTER");
    //백엔드 연결
    var registeredUser = await fetchRegisterPost(validUser,imageModel);
    if (registeredUser != null)
      return registeredUser;
    else {
      return null; //ToDo: error처리
    }
  }

  void getImage() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 150.0, maxHeight: 150.0);

    setUserImageFileToRegister(image);
  }

  @override
  void dispose() {
    _userIdToRegister.close();
    _userImageFileToRegister.close();
    _userNickNameToRegister.close();
    _userPasswordToRegister.close();
  }
}
