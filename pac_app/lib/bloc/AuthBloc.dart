import 'dart:async';
import 'dart:convert';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:pac_app/AuthState.dart';

import 'package:rxdart/rxdart.dart';

class AuthBloc implements Bloc {
  final _authentication = BehaviorSubject<AuthState>();

  Stream<AuthState> get authentication => _authentication.stream;
  Function(AuthState) get setAuthentication => _authentication.sink.add;
  

  @override
  dispose() {
    _authentication.close();
  }
}
