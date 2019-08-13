import 'package:flutter/material.dart';
import 'package:pac_app/bloc/LoginValidatorBloc.dart';
import 'AuthBloc.dart';

class BlocProvider extends InheritedWidget {
  final blocState = new _BlocState(
    loginValidatorBloc: LoginValidatorBloc(),
    authBloc:AuthBloc(),
  );

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static _BlocState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .blocState;
  }
}

class _BlocState {
  final LoginValidatorBloc loginValidatorBloc;
  final AuthBloc authBloc;

  _BlocState({
    this.loginValidatorBloc,
    this.authBloc
  });

}