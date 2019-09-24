import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pac_app/bloc/MultipleBlocProvider.dart';
import '../fixed/appBar.dart';
import '../fixed/IngredientInfo/IngredientsList.dart';
import '../fixed/IngredientInfo/Ingredient.dart';
import '../fixed/IngredientInfo/IngredientChip.dart';
import '../fixed/IngredientInfo/IngredientSet.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:csv/csv.dart';
import 'dart:async'show Future;
import 'dart:convert';
class SelectIngredientPage extends StatefulWidget {
  @override
  _SelectIngredientPageState createState() => new _SelectIngredientPageState();
}

class _SelectIngredientPageState extends State<SelectIngredientPage> {
  List<Ingredient> _ingredient;


  MakeChipList(List<Ingredient> ingredient) {
    setState(() {
      _ingredient = ingredient;
      //_chips= ingredients.getIngredientChip(_productList)
    });
  }

  @override
  Widget build(BuildContext context) {

    final bloc = MultipleBlocProvider.of(context).authBloc;
    return new Scaffold(
      appBar: appBar.getAppBar(context,bloc),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 4.0,
              runSpacing: 0.0,
              children: IngredientChip.generateChipList(),
            ),
            Container(
              child: IngredientsList(
                ingredient: [
                  new Ingredient("새우", CategoryCode.MEAT, false),
                  new Ingredient("식빵", CategoryCode.GRAIN, false),
                  new Ingredient("국수", CategoryCode.GRAIN, false),
                  new Ingredient("대파", CategoryCode.VEGITABLE, false),
                  new Ingredient("치즈", CategoryCode.ETC, false),
                  new Ingredient("우유", CategoryCode.ETC, false),
                  new Ingredient("돼지고기", CategoryCode.MEAT, false),
                  new Ingredient("간장", CategoryCode.SEASONING, false),
                  new Ingredient("소금", CategoryCode.SEASONING, false),
                  new Ingredient("양파", CategoryCode.VEGITABLE, false),
                ],
              ),
            ),
          ]),
    );
  }
}
