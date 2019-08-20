import 'dart:convert';
import 'dart:io';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
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
    } else {
      //error처리
      return null;
    }
  }

  Future<String> submit() async {
    final _userId = _userToRegisterUserId.value;
    final _password = _userToRegisterPassword.value;
    final _nickName = _userToRegisterNickName.value;
    final _imgFile = _userToRegisterImgFile.value;

    UserModel validUser = UserModel(id: _userId,password: _password,nickName: _nickName,profileImgPath: imgFIle.toString());
    //백엔드 연결
    debugPrint(validUser.toString());
    if (await fetchRegisterPost(validUser)!=null) {
      return "true";
    } else {
      return "false";
      //ToDo: error처리
    }
  }

  @override
  void dispose() {
    _userToRegisterUserId.close();
    _userToRegisterNickName.close();
    _userToRegisterPassword.close();
    _userToRegisterImgFile.close();
  }
  

}