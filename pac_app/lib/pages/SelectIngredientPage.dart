import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pac_app/AuthState.dart';
import 'package:pac_app/bloc/MultipleBlocProvider.dart';
import 'package:pac_app/fixed/appBar.dart';
import 'package:pac_app/fixed/IngredientInfo/IngredientsList.dart';
import 'package:pac_app/fixed/IngredientInfo/Ingredient.dart';
import 'package:pac_app/fixed/IngredientInfo/IngredientChip.dart';
import 'package:pac_app/fixed/IngredientInfo/IngredientSet.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:pac_app/pages/searchResultPage.dart';
class SelectIngredientPage extends StatefulWidget {
  @override
  _SelectIngredientPageState createState() => new _SelectIngredientPageState();
}

class _SelectIngredientPageState extends State<SelectIngredientPage> {

  List<List<dynamic>> datas = [];
  List<Ingredient> _ingredient = List<Ingredient>();

  loadAsset() async {
    final myData = await rootBundle.loadString("datas/IngredientData.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    datas = csvTable;
    return datas;

  }


  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    loadAsset().then((datas) {
        for(var data in datas){
          _ingredient.add(new Ingredient(data[0].toString(),CategoryCode.values[int.parse(data[1].toString())-1],false));
        };
        setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    final authBloc = MultipleBlocProvider.of(context).authBloc;
    final loginBloc = MultipleBlocProvider.of(context).loginValidatorBloc;

    return new Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: StreamBuilder(
            stream: authBloc.authentication,
            builder: (context,snapshot){
              if(snapshot.data==AuthState.admin){
                return appBar.getAppBarWithAuthAdmin(context, authBloc);
              }else if(snapshot.data==AuthState.user){
                return appBar.getAppBarWithAuthUser(context, authBloc,loginBloc.getCurrentUserData);
              }else {
                return appBar.getAppBarWithNoneUser(context);
              }
            },
          )// StreamBuilder
      ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IngredientChip(),
            Container(
              child: IngredientsList(
                _ingredient,
              ),
            ),
            //TODO : 클릭시 결과 화면으로 넘어가야함.
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return searchResultPage();
                    }));
              },
              child: new Text('검색'),
            )
          ]),
    );
  }
}
