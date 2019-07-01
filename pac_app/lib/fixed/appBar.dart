import 'package:flutter/material.dart';

// ignore: camel_case_types
class appBar {
  static getAppBar(BuildContext context, String status) {
    // TODO: status 에 따라서 login 전/후 만들기
    return new AppBar(
      backgroundColor: Colors.white,
      leading: PopupMenuButton(
        icon: Icon(Icons.menu, color: Colors.black),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem( //TODO : 텍스트 추가하기
              child: IconButton(
                icon: Icon(Icons.fastfood),
                onPressed: () {},
              ),
            ),
            PopupMenuItem(
              child: IconButton(
                icon: Icon(Icons.people),
                onPressed: () {},
              ),
            ),
            PopupMenuItem(
              child: IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {},
              ),
            ),
            PopupMenuItem(
              child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ),
          ];
        },
      ),
      actions: <Widget>[
        //login button
        FlatButton(
          textColor: Colors.black,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          splashColor: Colors.blueAccent,
          onPressed: () {
           // //TODO: goto Login Page
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
