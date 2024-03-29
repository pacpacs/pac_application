/**
 * 회원가입을 위한 register Page
 *
 * @author 서윤경
 * @version 1.0, P&C 의 register Page
 * @date 2019.07.03
 */

import 'package:flutter/material.dart';

import '../style/textStyle.dart';
import '../fixed/userInputForm.dart';

class registerPage extends StatefulWidget {
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        margin: new EdgeInsets.all(15.0),
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Reigster", style: textStyle.headLineText),
                Text("for Pick & Cook", style: textStyle.subHeadLineText),
                Form(key: _formKey, child: userInputForm.getUserInputForm(context,_formKey)),
              ],
            )),
      ),
    );
  }


}
