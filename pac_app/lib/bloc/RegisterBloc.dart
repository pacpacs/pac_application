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

<<<<<<< HEAD
  final _userToRegisterUserId = BehaviorSubject<String>();
  final _userToRegisterPassword = BehaviorSubject<String>();
  final _userToRegisterNickName = BehaviorSubject<String>();
  final _userToRegisterImgFile = BehaviorSubject<File>();

  Stream<String> get userId => _userToRegisterUserId.stream;
  Stream<String> get password => _userToRegisterPassword.stream;
  Stream<String> get nickName => _userToRegisterNickName.stream;
  Stream<File> get imgFIle =>  _userToRegisterImgFile.stream;

  Function(String) get setUserId => _userToRegisterUserId.sink.add;
  Function(String) get setPassword => _userToRegisterPassword.sink.add;
  Function(String) get setNickName => _userToRegisterNickName.sink.add;
  Function(File) get setImgFile => _userToRegisterImgFile.sink.add;

  Future<UserModel> fetchRegisterPost(UserModel user) async {
    // final response = await http.post('http://192.168.0.57:8080/users/login',
    //     body: {"user": user}); //랩실
        
    final response = await http.post('http://125.130.191.224:8080/users/login',
        body: {"user": user}); //집
    if (response.statusCode == 200) {
      debugPrint(response.body.toString()) ;
      UserModel user = UserModel.fromJson(json.decode(response.body));  
      if(LoginValidatorBloc().fetchLoginPost(user.id,user.password)!=null){
        return user;
      }else{
        return null;
      }    
=======
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
>>>>>>> 6b5d1631b262f12f49622ccd4d685be13d1f2e9a
    } else {
      //error처리
      return null;
    }
  }

  Future<String> submit() async {
<<<<<<< HEAD
    final _userId = _userToRegisterUserId.value;
    final _password = _userToRegisterPassword.value;
    final _nickName = _userToRegisterNickName.value;
    final _imgFile = _userToRegisterImgFile.value;

    UserModel validUser = UserModel(id: _userId,password: _password,nickName: _nickName,profileImgPath: imgFIle.toString());
=======
    File file = _userImageFileToRegister as File;
     if (file == null) return "";
   String base64Image = base64Encode(file.readAsBytesSync());
   String fileName = file.path.split("/").last;
 UserModel validUser = UserModel(id: _userIdToRegister.value,password: _userPasswordToRegister.value,nickName: _userNickNameToRegister.value,profileImgPath: fileName);
   
>>>>>>> 6b5d1631b262f12f49622ccd4d685be13d1f2e9a
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
<<<<<<< HEAD
    _userToRegisterUserId.close();
    _userToRegisterNickName.close();
    _userToRegisterPassword.close();
    _userToRegisterImgFile.close();
=======
    _userIdToRegister.close();
    _userImageFileToRegister.close();
    _userNickNameToRegister.close();
    _userPasswordToRegister.close();
>>>>>>> 6b5d1631b262f12f49622ccd4d685be13d1f2e9a
  }
}
