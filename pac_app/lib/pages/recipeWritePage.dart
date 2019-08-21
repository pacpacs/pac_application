import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pac_app/fixed/card/WriteCardElement.dart';
import 'package:pac_app/fixed/card/ShowCardBloc.dart';

class RecipeWritePage extends StatefulWidget {
  RecipeWritePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _RecipeWritePageState createState() => _RecipeWritePageState();
}

class _RecipeWritePageState extends State<RecipeWritePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowCardBloc>(
        builder: (context) => ShowCardBloc(),
        child: ListView(children: <Widget>[
          //레시피 내용 작성 시, 자연스럽게 키보드에 화면이 밀려올라가게 하기 위해서 ListView사용
          Container(
              height: 50,
              child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: '레시피 제목'),
                      cursorColor: Colors.amber,
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
