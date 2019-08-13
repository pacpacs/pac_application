import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pac_app/AuthState.dart';
import 'package:pac_app/bloc/AuthBloc.dart';
import 'package:pac_app/bloc/BlocProvider.dart';
import 'package:pac_app/fixed/profile/User.dart';
import 'package:pac_app/model/UserModel.dart';
import 'package:pac_app/pages/LoginPage.dart';

// ignore: camel_case_types
class appBar {
  // static checkStatus(BuildContext context) {
  //   if (context.widget.toString() != "MyHomePage") {
  //     return new IconButton(
  //       icon: new Icon(Icons.arrow_back, color: Colors.black),
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //     );
  //   }
  // }

  static AppBar getAppBar(BuildContext context, AuthBloc bloc) {
    AuthState authState;
    bloc.authentication.listen((value) {
      switch (value) {
        case AuthState.admin:
          return getAppBarWithAuthAdmin(context, bloc);
          break;
        case AuthState.user:
          UserModel user = BlocProvider.of(context)
              .loginValidatorBloc
              .currentUser as UserModel;
          return getAppBarWithAuthUser(context, bloc, user);

          break;
        case AuthState.noneUser:
          return getAppBarWithNoneUser(context);
          break;
      }
     
    },  onError: (error) {
      print("Some Error");
    });
    
  }

  static AppBar getAppBarWithAuthAdmin(BuildContext context, AuthBloc bloc) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        //login button
        Text(
          "Admin",
          style: TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }

  static AppBar getAppBarWithAuthUser(
      BuildContext context, AuthBloc bloc, UserModel user) {
    User currentUser = User(user: user);

    return AppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        //login button
        currentUser.getProfileImage(50),
        Text(currentUser.user.nickName),
        FlatButton(
          textColor: Colors.black,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          splashColor: Colors.blueAccent,
          onPressed: () {
            bloc.setAuthentication(AuthState.noneUser);
          },
          child: Text(
            "Logout",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ],
    );
  }

  static AppBar getAppBarWithNoneUser(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        //login button
        FlatButton(
          textColor: Colors.black,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          splashColor: Colors.blueAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ],
    );
  }
}
