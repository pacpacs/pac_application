import 'package:flutter/material.dart';
import 'package:pac_app/fixed/card/CardForm.dart';
import 'package:pac_app/fixed/card/ShowCardElement.dart';
import 'package:pac_app/fixed/profile/User.dart';
import 'package:pac_app/model/UserModel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pac_app/model/RecipeModel.dart';

class RecipeShowPage extends StatefulWidget {
  User user = new User(
      user: UserModel(
          id: "carys3115",
          password: "pacpac",
          nickName: "syk",
          profileImgPath:
              "https://pbs.twimg.com/profile_images/965791773522984960/QhuhU3pp_400x400.jpg"));
  
  static List<RecipeModel> dummy1 = [new RecipeModel(
    author: '남수',
    createdDate: DateTime.now(),
    description: '재료를 잘게썬다.\n한 입 크기로 자르는 것이 중요.',
    id: '123asdf',
    imgPath: 'https://i.imgur.com/innssyj.png',
    kcal: 400,
    orderNum: 1,
    title: '짱 맛있는 샥슈카-에그인헬')];

  RecipeModelList dummylist = new RecipeModelList(recipeModelList: dummy1);
  
  @override
  _RecipeShowPageState createState() => _RecipeShowPageState(dummyrecipeList: dummylist);
}

class _RecipeShowPageState extends State<RecipeShowPage> {
  final RecipeModelList dummyrecipeList;
  _RecipeShowPageState({Key key, @required this.dummyrecipeList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(child: widget.user.getProfileImage(50)),
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: AutoSizeText(dummyrecipeList.recipeModelList[0].title,
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
                              child: AutoSizeText(dummyrecipeList.recipeModelList[0].author,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic)),
                            ),
                          ),
                          Container(
                            child: AutoSizeText(dummyrecipeList.recipeModelList[0].createdDate.toString(),
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
              padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
              child: Container(child: CardForm(ShowCardElement(imageUrl: dummyrecipeList.recipeModelList[0].imgPath, recipeDescription: dummyrecipeList.recipeModelList[0].description,)))),
        )
      ],
    );
  }
}
