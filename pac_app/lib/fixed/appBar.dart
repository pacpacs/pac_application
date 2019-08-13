import 'package:flutter/material.dart';
import 'package:pac_app/pages/LoginPage.dart';

// ignore: camel_case_types
class appBar {
  
  static checkStatus(BuildContext context){
    if(context.widget.toString() != "MyHomePage"){
      return new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){Navigator.pop(context);},);
    }
  }
  
  static getAppBar(BuildContext context, bool status) {
    // TODO: status 에 따라서 login 전/후 만들기
    return new AppBar(
      leading: checkStatus(context),
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
