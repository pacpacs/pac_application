import 'package:flutter/material.dart';
import 'package:pac_app/fixed/card/cardForm.dart';
import 'package:pac_app/fixed/profile/User.dart';
import 'package:pac_app/model/UserModel.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: widget.user.getProfileImage(50)),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: AutoSizeText(" Recipe Title ",
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 28,
                                fontStyle: FontStyle.italic)),
                      ),
                      Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: AutoSizeText(" Info1",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: AutoSizeText(" Info2",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic)),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(color: Colors.black87),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Container(
                decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.black)),
                width: 300,
                height: 200,
                child: cardForm(new Card())),
          ),
        )
      ],
    );
  }
}
