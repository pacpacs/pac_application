import 'package:flutter/material.dart';

import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:pac_app/AuthState.dart';
import 'package:pac_app/bloc/AuthBloc.dart';
import 'package:pac_app/bloc/BlocProvider.dart';
import 'package:pac_app/bloc/LoginValidatorBloc.dart';
import 'package:pac_app/main.dart';

import '../style/textStyle.dart';
import 'registerPage.dart';

import '../bloc/BlocProvider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of(context).loginValidatorBloc;
    final authBloc = BlocProvider.of(context).authBloc;

    return BlocProvider(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text('Login ', style: textStyle.headLineText),
                      Text('for Pick & Cook', style: textStyle.subHeadLineText),
                    ],
                  )),
              userIdField(loginBloc),
              passwordField(loginBloc),
              submitButtonField(loginBloc,authBloc),
              signInButtonField(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget userIdField(LoginValidatorBloc bloc) {
    return StreamBuilder(
        stream: bloc.userId,
        builder: (context, snapshop) {
          // return Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 40),
          //     child: Column(children: <Widget>[
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: bloc.setUserId,
              style: new TextStyle(height: 0.5, color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.8,
                      )),
                  hintText: 'ID'),
            ),
          );
          // ]));
        });
  }

  passwordField(LoginValidatorBloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: bloc.setPassword,
              style: new TextStyle(height: 0.5, color: Colors.black),
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 0.8,
                      )),
                  hintText: 'Password'),
            ),
          );
        });
  }

  submitButtonField(LoginValidatorBloc bloc, AuthBloc authBloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return SizedBox(
            width: 225, //TODO: 비율로바꿔야할듯...
            child: RaisedButton(
                //TODO: 버튼에 애니메이션 입히기
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.black,
                color: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    side: BorderSide(color: Colors.black, width: 0.8)),
                onPressed: () {
                  bloc
                      .submit()
                      .then((onValue) => {
                            authBloc
                                .setAuthentication(AuthState.user),
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()))
                          })
                      .catchError((onError) => {
                            showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Error occurs"),
                                    content: Text(onError),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Regret'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                })
                          });
                },
                child: new Text('Login')),
          );
        });
  }

  signInButtonField(BuildContext context) {
    return Column(
      children: <Widget>[
        SignInButtonBuilder(
          text: 'Sign in with Pick & Cook',
          icon: Icons.add_box,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => registerPage()),
            );
          },
          backgroundColor: Colors.blueGrey[700],
        ),
        SignInButton(
          Buttons.Facebook,
          onPressed: () {},
        )
      ],
    );
  }
}
