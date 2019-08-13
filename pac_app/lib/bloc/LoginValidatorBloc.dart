import 'dart:async';
import 'dart:convert';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:pac_app/model/UserModel.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

class LoginValidatorBloc implements Bloc {
  final _userId = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  final _currentUser = BehaviorSubject<UserModel>();

  Stream<String> get userId => _userId.stream;
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(userId, password, (i, p) => true);

  Stream<UserModel> get currentUser => _currentUser.stream;

  Function(String) get setUserId => _userId.sink.add;
  Function(String) get setPassword => _password.sink.add;
  Function(UserModel) get setCurrentUser =>_currentUser.sink.add;

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 8) {
      sink.add(password);
    } else {
      sink.addError("Password Length must be over 8");
    }
  });

  Future<bool> fetchPost(String validUserId, String validPassword) async {
    final userId = validUserId;
    final password = validPassword;

    final response = await http.post('https://localhost:8080/users/login',
        body: {'userId': userId, 'password': password});

    if (response.statusCode == 200) {
      this.setCurrentUser(UserModel.fromJson(json.decode(response.body)));
      debugPrint(currentUser.toString());
      return true;
    } else {
      //error처리
      return false;
    
  }}

  submit() async {
    final validUserId = _userId.value;
    final validPassword = _password.value;
    //백엔드 연결
    debugPrint(validUserId);
    debugPrint(validPassword);
    if(await fetchPost(validUserId,validPassword)){

    }else{
      //ToDo: error처리
    }
  }

  @override
  dispose() {
    _userId.close();
    _password.close();
    _currentUser.close();
  }
}
