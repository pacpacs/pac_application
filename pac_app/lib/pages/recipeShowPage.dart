import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pac_app/AuthState.dart';
import 'package:pac_app/bloc/LoginValidatorBloc.dart';
import 'package:pac_app/bloc/MultipleBlocProvider.dart';
import 'package:pac_app/fixed/card/ShowCardElement.dart';
import 'package:pac_app/fixed/profile/User.dart';
import 'package:pac_app/fixed/card/ShowCardBloc.dart';
import 'package:pac_app/model/UserModel.dart';
import 'package:pac_app/model/RecipeModel.dart';

class RecipeShowPage extends StatefulWidget {
  static var jsonUserData =
      '{"_id":"5d524dd34e1d1b238c19b13b","userId":"carys3115","nickName":"GagnEE","password":"administrator","imgPath":"https://pbs.twimg.com/profile_images/965791773522984960/QhuhU3pp_400x400.jpg"}';
  static var parsedJson = jsonDecode(jsonUserData);

//TODO:조리방법 리스트는 http통신 bloc 레시피 가져오는 bloc에서 http-post로 가져올 것
  static List<RecipeModel> dummy1 = [
    new RecipeModel(
        author: '남수',
        createdDate: DateTime.now(),
        description: '재료를 잘게썬다.\n한 입 크기로 자르는 것이 중요.',
        id: '123asdf',
        imgPath: 'https://i.imgur.com/innssyj.png',
        kcal: 400,
        orderNum: 1,
        title: '짱 맛있는 샥슈카-에그인헬'),
    new RecipeModel(
        author: '남수',
        createdDate: DateTime.now(),
        description: '월급을 잘게썬다.\n한 통장 크기로 자르는 것이 중요.',
        id: '123asdf',
        imgPath: 'https://i.imgur.com/RmtzZ85.jpg',
        kcal: 400,
        orderNum: 1,
        title: '짱 맛있는 샥슈카-에그인헬')
  ];

  RecipeModelList dummylist = new RecipeModelList(recipeModelList: dummy1);
  User user;
  RecipeShowPage(this.user);

  @override
  _RecipeShowPageState createState() =>
      _RecipeShowPageState(recipe: dummylist, user: user);
}

class _RecipeShowPageState extends State<RecipeShowPage> {
  final RecipeModelList recipe;

  User user;

  _RecipeShowPageState({Key key, @required this.recipe, this.user});

  @override
  Widget build(BuildContext context) {
    
    if (this.user.user == null) {
      return Text("보시려면 로그인을 해주세요 >_o");
    } else {
      return BlocProvider<ShowCardBloc>(
        builder: (context) => ShowCardBloc(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(child: user.getProfileImage(50)), //글쓴이 정보
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: AutoSizeText(recipe.recipeModelList[0].title,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 28,
                                    fontStyle: FontStyle.italic)),
                          ),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: AutoSizeText(
                                      recipe.recipeModelList[0].author,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic)),
                                ),
                              ),
                              Container(
                                child: AutoSizeText(
                                    recipe.recipeModelList[0].createdDate
                                        .toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic)),
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
            Flexible(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 20.0),
                  child: ShowCardElement(
                    recipe: recipe.recipeModelList,
                  )),
            )
          ],
        ),
      );
    }
  }
}
