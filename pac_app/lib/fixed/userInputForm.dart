import 'dart:developer';
import 'dart:io';

/**
 * user에 대한 정보가 담긴 Form
 *
 * @author 서윤경
 * @version 1.0, P&C 의 userInputForm
 * @date 2019.07.03
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pac_app/bloc/AuthBloc.dart';
import 'package:pac_app/bloc/LoginValidatorBloc.dart';

import 'package:pac_app/bloc/RegisterBloc.dart';
import 'package:pac_app/main.dart';

import '../AuthState.dart';

class UserInputForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final RegisterBloc registerBloc;
  final LoginValidatorBloc loginBloc;
  final AuthBloc authBloc;

  UserInputForm(
      {Key key, this.formKey, this.registerBloc, this.loginBloc, this.authBloc})
      : super(key: key);

  _UserInputFormState createState() => _UserInputFormState(
      this.formKey, this.registerBloc, this.loginBloc, this.authBloc);
}

class _UserInputFormState extends State<UserInputForm> {
  Future<File> imageFile;

  final GlobalKey<FormState> formKey;
  RegisterBloc registerBloc;
  LoginValidatorBloc loginBloc;
  AuthBloc authBloc;
  _UserInputFormState(
      this.formKey, this.registerBloc, this.loginBloc, this.authBloc);

  String _validateUserId(String value) {
    if (value.length < 5 || value.length > 15)
      return '5글자이상 15글자이하여야합니다.';
    else
      return null;
  }

  String _validatePassword(String value) {
    if (value.length < 9)
      return '8글자 이상이어야합니다.';
    else
      return null;
  }

  String _validateUserName(String value) {
    if (value.length < 3)
      return '2글자 이상이어야합니다.';
    else
      return null;
  }

  void chooseImage() {
    registerBloc.getImage();
  }

  Widget showImage() {
    return StreamBuilder(
      stream: registerBloc.userImageFileToRegister,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            null != snapshot.data) {
          log("hasSnapshot");
          log(snapshot.data.toString());
          return profilePicture(snapshot.data);
        } else if (null != snapshot.error) {
          log("error");
          return Text('Error Picking Image', textAlign: TextAlign.center);
        } else {
          log("default");
          return defaultPicture();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool _autoValidate = false;
    String _name;
    String _password;
    String _userId;

    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: StreamBuilder<String>(
              stream: registerBloc.userIdToRegister,
              builder: (context, snapshot) {
                return TextFormField(
                  onSaved: registerBloc.setUserIdToRegister,
                  decoration: const InputDecoration(labelText: 'userID'),
                  validator: _validateUserId,
                );
              }),
        ),
        StreamBuilder<String>(
            stream: registerBloc.userPasswordToRegister,
            builder: (context, snapshot) {
              return TextFormField(
                onSaved: registerBloc.setUserPasswordToRegister,
                decoration: const InputDecoration(labelText: 'password'),
                validator: _validatePassword,
                obscureText: true,
              );
            }),
        StreamBuilder<String>(
            stream: registerBloc.userNickNameToRegister,
            builder: (context, snapshot) {
              return TextFormField(
                decoration: const InputDecoration(labelText: 'userName'),
                keyboardType: TextInputType.text,
                validator: _validateUserName,
                onSaved: registerBloc.setUserNickNameToRegister,
              );
            }),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showImage(),
              //TODO: make show user's profile image
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(" Choose Profile Image"),
              ),
              Expanded(
                  child: FlatButton(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.blueGrey,
                ),
                onPressed: chooseImage, //TODO: get Image from server
                color: Colors.white,
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false
              // otherwise.
              if (formKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                registerBloc.submit().then((user) {
                  if (user != null) {
                    loginBloc
                        .fetchLoginPost(user.id, user.password)
                        .then((onValue) => {
                              authBloc.setAuthentication(AuthState.user),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()))
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
                  }
                });
              }
            },
            child: Text('Submit'),
          ),
        ),
      ],
    );
  }
}

Widget profilePicture(File snapshotData) {
  return Container(
    width: 50.0,
    height: 50.0,
    decoration: new BoxDecoration(
      image: new DecorationImage(
        image: FileImage(snapshotData),
        fit: BoxFit.fill,
      ),
      borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
      border: new Border.all(
        color: Colors.black,
        width: 1.0,
      ),
    ),
  );
}

Widget defaultPicture() {
  return Container(
    width: 50,
    height: 50,
    decoration: new BoxDecoration(
      image: new DecorationImage(
        image: AssetImage('images/default_picture.png'),
        fit: BoxFit.fill,
      ),
      borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
      border: new Border.all(
        color: Colors.black,
        width: 1.0,
      ),
    ),
  );
}
