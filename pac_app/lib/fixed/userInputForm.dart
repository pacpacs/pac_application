/**
 * user에 대한 정보가 담긴 Form
 *
 * @author 서윤경
 * @version 1.0, P&C 의 userInputForm
 * @date 2019.07.03
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pac_app/bloc/LoginValidatorBloc.dart';
import 'package:pac_app/bloc/BlocProvider.dart';
import 'package:pac_app/bloc/RegisterBloc.dart';
import 'package:pac_app/main.dart';
import 'package:pac_app/model/UserModel.dart';
import 'package:image_picker/image_picker.dart';

class UserInputForm {
  final userIdController = new TextEditingController();
  final passwordController = new TextEditingController();
  final userNameController = new TextEditingController();
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    _image = image;
  }

  getUserInputForm(BuildContext context, GlobalKey<FormState> _formKey) {
    LoginValidatorBloc loginValidatorBloc =
        BlocProvider.of(context).loginValidatorBloc;
    RegisterBloc registerBloc = BlocProvider.of(context).registerBloc;
    bool _autoValidate = false;
    String _name;
    String _password;
    String _userId;

    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextFormField(
            controller: userIdController,
            decoration: InputDecoration(labelText: 'userID'),
            validator: _validateUserId,
            onSaved: (v) => userIdController.text = v,
          ),
        ),
        TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(labelText: 'password'),
          validator: _validatePassword,
          obscureText: true,
        ),
        TextFormField(
          controller: userNameController,
          decoration: const InputDecoration(labelText: 'userName'),
          keyboardType: TextInputType.text,
          validator: _validateUserName,
          onSaved: (String val) {
            _name = val;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/140x100')),
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
                  onPressed: getImage,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));

                UserModel userToRegister = UserModel(
                    id: userIdController.text,
                    password: passwordController.text,
                    nickName: userNameController.text,
                    profileImgPath: _image.path);

                await registerBloc
                    .fetchRegisterPost(userToRegister)
                    .then((onValue) =>
                        {MaterialPageRoute(builder: (context) => MyHomePage())})
                    .catchError((onError) => {
                          showDialog(
                              //TODO: LoginPage와 같은 것 따로 빼도록 하자.
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
            },
            child: Text('Submit'),
          ),
        ),
      ],
    );
  }

  static String _validateUserId(String value) {
    if (value.length < 5 || value.length > 15)
      return '5글자이상 15글자이하여야합니다.';
    else
      return null;
  }

  static String _validatePassword(String value) {
    if (value.length < 9)
      return '8글자 이상이어야합니다.';
    else
      return null;
  }

  static String _validateUserName(String value) {
    if (value.length < 3)
      return '2글자 이상이어야합니다.';
    else
      return null;
  }
}
