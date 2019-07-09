import 'package:flutter/material.dart';
import 'package:pac_app/fixed/card/cardForm.dart';
import 'package:pac_app/fixed/profile/User.dart';
import 'package:pac_app/model/UserModel.dart';

class recipeShowPage extends StatefulWidget {
  User user = new User(
      user: UserModel(
          id: "carys3115",
          password: "pacpac",
          nickName: "syk",
          profileImgPath:
              "https://pbs.twimg.com/profile_images/965791773522984960/QhuhU3pp_400x400.jpg"));
  @override
  _recipeShowPageState createState() => _recipeShowPageState();
}

class _recipeShowPageState extends State<recipeShowPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(10.0),
                  child: widget.user.getProfileImage(50)),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(" Receipe Title ",
                      overflow: TextOverflow.visible,  
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                              fontStyle: FontStyle.italic)),
                    ),
                    Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: new BoxDecoration(
                                    border:
                                        new Border.all(color: Colors.black)),
                                child: Center(
                                  child: Text(" Info1",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: new BoxDecoration(
                                    border:
                                        new Border.all(color: Colors.black)),
                                child: Center(
                                  child: Text(" Info2",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic)),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(color: Colors.black87),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.black)),
              width: 300,
              height: 200,
              child: cardForm(new Card())),
        )
      ],
    );
  }
}
