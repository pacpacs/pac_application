import 'package:flutter/material.dart';

import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../style/textStyle.dart';
import 'registerPage.dart';

class loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text('Login ',
                        style: textStyle.headLineText),
                    Text('for Pick & Cook',
                        style: textStyle.subHeadLineText),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: new TextStyle(height: 0.5, color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 0.8,
                              )),
                          hintText: 'ID'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: new TextStyle(height: 0.5, color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 0.8,
                              )),
                          hintText: 'Password'),
                    ),
                  ),
                  SizedBox(
                    width: 225, //TODO: 비율로바꿔야할듯...
                    child: RaisedButton(
                        //TODO: 버튼에 애니메이션 입히기
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.black,
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            side: BorderSide(color: Colors.black, width: 0.8)),
                        onPressed: () {
                          Navigator.pop(
                              context); // TODO: 로그인 validation 및 status
                        },
                        child: new Text('Login')),
                  )
                ])),
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
            ),
          ],
        ),
      ),
    );
  }
}
