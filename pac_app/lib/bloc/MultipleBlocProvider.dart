import 'package:flutter/material.dart';
import 'package:pac_app/bloc/IngredientBloc.dart';
import 'package:pac_app/bloc/LoginValidatorBloc.dart';
import 'package:pac_app/fixed/IngredientInfo/Ingredient.dart';
import 'AuthBloc.dart';
import 'RegisterBloc.dart';


/**
 * Multi Bloc 사용가능하게 해주는 BlocProvider
 * 
 * @author 서윤경
 * @version 1.0
 * @date 2019.08.16
 */

class MultipleBlocProvider extends InheritedWidget {
  final blocState = new _BlocState(
    loginValidatorBloc: LoginValidatorBloc(),
    authBloc:AuthBloc(),
    registerBloc:RegisterBloc(),
    ingredientBloc: IngredientBloc(),
  );

  MultipleBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static _BlocState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MultipleBlocProvider) as MultipleBlocProvider)
        .blocState;
  }
}

class _BlocState {
  final LoginValidatorBloc loginValidatorBloc;
  final AuthBloc authBloc;
  final RegisterBloc registerBloc;
  final IngredientBloc ingredientBloc;

  _BlocState({
    this.loginValidatorBloc,
    this.authBloc, this.registerBloc,
    this.ingredientBloc
  });

}