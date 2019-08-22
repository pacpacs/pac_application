/**
 * user에 대한 정보가 담긴 Form
 *
 * @author 서윤경
 * @version 1.0, P&C 의 userInputForm
 * @date 2019.07.03
 */

import 'package:flutter/material.dart';

class userInputForm {
  static getUserInputForm(BuildContext context, GlobalKey<FormState> _formKey) {
    bool _autoValidate = false;
    String _name;
    String _password;
    String _userId;

    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'userID'),
            validator: _validateUserId,
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'password'),
          validator: _validatePassword,
          obscureText: true,
        ),
        TextFormField(
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
                  onPressed: () {}, //TODO: get Image from server
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false
              // otherwise.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
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
