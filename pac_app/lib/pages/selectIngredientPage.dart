import 'package:flutter/material.dart';
import '../fixed/appBar.dart';
import '../fixed/ingredientInfo/ingredientsList.dart';
import '../fixed/ingredientInfo/ingredient.dart';
import '../fixed/ingredientInfo/ingredientChip.dart';
import '../fixed/ingredientInfo/ingredientSet.dart';

class selectIngredientPage extends StatefulWidget {
  @override
  _selectIngredientPageState createState() => new _selectIngredientPageState();
}

class _selectIngredientPageState extends State<selectIngredientPage> {
  List<Ingredient> _ingredient;

  MakeChipList(List<Ingredient> ingredient) {
    setState(() {
      _ingredient = ingredient;
      //_chips= ingredients.getIngredientChip(_productList)
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 0,
              child: TextField(
                //검색 창
                style: TextStyle(
                    fontSize: 12.0,
                    height: 0.5,
                    color: const Color(0xFF000000),
                    fontFamily: "Roboto"),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(50.0))),
                    hintText: 'gone'),
                onChanged: (String a) {
                  print('changed to ' + a);
                },
              ),
            ),
            //ToDo : chip list수정하는 곳.. Chip 상태만 바꾸면 되네
            Container(
              child: IngredientsList(
                ingredient: [
                  new Ingredient("새우", categoryCode.meat, false),
                  new Ingredient("식빵", categoryCode.grain, false),
                  new Ingredient("국수", categoryCode.grain, false),
                  new Ingredient("대파", categoryCode.vegitable, false),
                  new Ingredient("치즈", categoryCode.etc, false),
                  new Ingredient("우유", categoryCode.etc, false),
                  new Ingredient("돼지고기", categoryCode.meat, false),
                  new Ingredient("간장", categoryCode.seasoning, false),
                  new Ingredient("소금", categoryCode.seasoning, false),
                  new Ingredient("양파", categoryCode.vegitable, false),
                ],
              ),
            ),
          ]),
    );
  }
}
