import 'package:flutter/material.dart';
import 'package:pac_app/bloc/LoginValidatorBloc.dart';
import 'AuthBloc.dart';


/**
 * Multi Bloc 사용가능하게 해주는 BlocProvider
 * 
 * @author 서윤경
 * @version 1.0
 * @date 2019.08.16
 */

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