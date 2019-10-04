import 'dart:async';
import 'dart:convert';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:pac_app/AuthState.dart';

import 'package:rxdart/rxdart.dart';


/**
 * 권한 체크 Login AuthBloc
 * 
 * @author 서윤경
 * @version 1.0
 * @date 2019.08.16
 */

class AuthBloc implements Bloc {
  final _authentication = BehaviorSubject<AuthState>();

  Stream<AuthState> get authentication => _authentication.stream;
  Function(AuthState) get setAuthentication => _authentication.sink.add;
  
  AuthBloc(){
    setAuthentication(AuthState.noneUser);
  }

  @override
  dispose() {
    
  }
}
