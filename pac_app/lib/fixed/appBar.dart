import 'package:flutter/material.dart';
import 'package:pac_app/pages/loginPage.dart';

// ignore: camel_case_types
class appBar {
  static getAppBar(BuildContext context, String status) {
    // TODO: status 에 따라서 login 전/후 만들기
    return new AppBar(
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
                MaterialPageRoute(
                    builder: (context) => loginPage())); //TODO: goto Login Page
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
