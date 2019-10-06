import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pac_app/fixed/card/WriteCardElement.dart';
import 'package:pac_app/fixed/card/ShowCardBloc.dart';
import 'package:pac_app/model/RecipeModel.dart';

class RecipeWritePage extends StatefulWidget {
  RecipeWritePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _RecipeWritePageState createState() => _RecipeWritePageState();
  //DATA:Recipe
  //     _basic(=RecipeModel)/process(RecipeProcessModel)/ingredient(RecipeModel중 IngredientList?)
}

class _RecipeWritePageState extends State<RecipeWritePage> {
  RecipeModel _recipe = new RecipeModel();
  TextEditingController _txtController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowCardBloc>(
        builder: (context) => ShowCardBloc(),
        child: ListView(children: <Widget>[
          //TODO:레시피process리스트랑 레시피개요(recipeModel) 전송할 FAB 추가+
          Container(
              height: 50,
              child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      controller: _txtController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: '레시피 제목'),
                      cursorColor: Colors.amber,
                      onChanged: _recipe.setTitle(_txtController.text),
                    ),
                  ))),
          Container(
            height: 200, //TODO:내용물 크기에 맞게 높이 변하도록
            child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(children: <Widget>[
                      Text('레시피 재료-재료선택화면 reuse'),
                      Wrap(children: <Widget>[
                        //TODO:재료(와 재료칩) 추가/삭제 ingredient bloc적용해서 Wrap 관리
                        Chip(
                          avatar:
                              CircleAvatar(backgroundColor: Colors.amberAccent),
                          label: Text('재료1ㅁㄴㅇㄻㄴㅇㄹ'),
                          onDeleted: () => {},
                        ),
                        Chip(
                          avatar:
                              CircleAvatar(backgroundColor: Colors.amberAccent),
                          label: Text('재료2ㄹ'),
                          onDeleted: () => {},
                        ),
                        Chip(
                          avatar:
                              CircleAvatar(backgroundColor: Colors.amberAccent),
                          label: Text('재료3ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ'),
                          onDeleted: () => {},
                        ),
                      ]),
                    ]))),
          ),
          WriteCardElement(),
        ]));
  }
}
