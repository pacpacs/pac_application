import 'dart:convert';

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

  final _userToRegister = BehaviorSubject<UserModel>();


  Stream<UserModel> get userToRegister => _userToRegister.stream;
  Function(UserModel) get setUserToRegister => _userToRegister.sink.add;

  Future<UserModel> fetchRegisterPost(UserModel user) async {
    final response = await http.post('http://192.168.0.57:8080/users/login',
        body: {"user": user});
     if (response.statusCode == 200) {
      debugPrint(response.body.toString()) ;
      UserModel user = UserModel.fromJson(json.decode(response.body));      
      return user;
    } else {
      //error처리
      return null;
    }
  }

  Future<String> submit() async {
    final validUser = _userToRegister.value;
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
    _userToRegister.close();
  }
  

}