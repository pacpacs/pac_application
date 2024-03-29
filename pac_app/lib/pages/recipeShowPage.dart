import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pac_app/fixed/card/ShowCardElement.dart';
import 'package:pac_app/fixed/profile/User.dart';
import 'package:pac_app/fixed/card/ShowCardBloc.dart';
import 'package:pac_app/model/RecipeProcessModel.dart';
import 'package:pac_app/model/UserModel.dart';
import 'package:pac_app/model/RecipeModel.dart';

class RecipeShowPage extends StatefulWidget {
  static var jsonUserData =
      '{"_id":"5d524dd34e1d1b238c19b13b","userId":"carys3115","nickName":"GagnEE","password":"administrator","imgPath":"https://pbs.twimg.com/profile_images/965791773522984960/QhuhU3pp_400x400.jpg"}';
  static var parsedJson = jsonDecode(jsonUserData);

  User user = new User(
      user: UserModel(
          id: parsedJson['userId'],
          password: parsedJson['password'],
          nickName: parsedJson['nickName'],
          profileImgPath: parsedJson['imgPath']));

//TODO:조리방법 리스트는 http통신 bloc 레시피 가져오는 bloc에서 http-post로 가져올 것
  static RecipeModel dummy = new RecipeModel(
      author: '남수',
      createdDate: DateTime.now(),
      description: '재료를 잘게썬다.\n한 입 크기로 자르는 것이 중요.',
      id: '123asdf',
      imgPath: 'https://i.imgur.com/innssyj.png',
      kcal: 400,
      orderNum: 1,
      title: '짱 맛있는 샥슈카-에그인헬');

//TODO:RecipeProcessModel로 변경 적용해야
  static List<RecipeProcessModel> dummy1 = [
    new RecipeProcessModel(null, 'https://i.imgur.com/RmtzZ85.jpg', null, null,
        21345, '재료를 잘게썬다.\n한 입 크기로 자르는 것이 중요.', 1),
    new RecipeProcessModel(null, 'https://i.imgur.com/RmtzZ85.jpg', null, null,
        21345, '월급잘썰.\n 한 통장 크기 중요', 2),
  ];

  RecipeProcessModelList dummylist = new RecipeProcessModelList(dummy1);

  @override
  _RecipeShowPageState createState() =>
      _RecipeShowPageState(recipe: dummy, recipe_step: dummylist);
}

class _RecipeShowPageState extends State<RecipeShowPage> {
  final RecipeModel recipe;
  final RecipeProcessModelList recipe_step;
  _RecipeShowPageState(
      {Key key, @required this.recipe, @required this.recipe_step});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowCardBloc>(
      builder: (context) => ShowCardBloc(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(child: widget.user.getProfileImage(50)), //글쓴이 정보
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: AutoSizeText(recipe.title,
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
                                    recipe.author,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic)),
                              ),
                            ),
                            Container(
                              child: AutoSizeText(
                                  recipe.createdDate
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
                  recipe: recipe_step.process_step,
                )),
          )
        ],
      ),
    );
  }
}
