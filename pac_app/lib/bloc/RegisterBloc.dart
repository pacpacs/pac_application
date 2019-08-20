import 'dart:convert';
import 'dart:io';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pac_app/bloc/LoginValidatorBloc.dart';
import 'package:pac_app/model/UserModel.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

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
  Function(String) get setUserPasswordToRegister => _userPasswordToRegister.sink.add;
  Function(String) get setUserNickNameToRegister => _userNickNameToRegister.sink.add;
  Function(File) get setUserImageFileToRegister => _userImageFileToRegister.sink.add;
  Future<UserModel> fetchRegisterPost(UserModel user, String base64image) async {
    
    final response = await http
        .post('http://192.168.0.57:8080/users/register', body: {"image":base64image,"user": user});
    if (response.statusCode == 200) {
      debugPrint(response.body.toString());
      return user;
    } else {
      //error처리
      return null;
    }
  }

  Future<String> submit() async {
    File file = _userImageFileToRegister as File;
     if (file == null) return "";
   String base64Image = base64Encode(file.readAsBytesSync());
   String fileName = file.path.split("/").last;
 UserModel validUser = UserModel(id: _userIdToRegister.value,password: _userPasswordToRegister.value,nickName: _userNickNameToRegister.value,profileImgPath: fileName);
   
    //백엔드 연결
   
    if (await fetchRegisterPost(validUser,base64Image) != null) {
      return "true";
    } else {
      return "false";
      //ToDo: error처리
    }
  }

 void getImage() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 150.0, maxHeight: 150.0).then((value){
          setUserImageFileToRegister(value);
        });
    
  }
  @override
  void dispose() {
    _userIdToRegister.close();
    _userImageFileToRegister.close();
    _userNickNameToRegister.close();
    _userPasswordToRegister.close();
  }
}
