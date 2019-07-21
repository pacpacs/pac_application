import 'package:flutter/material.dart';
import '../fixed/appBar.dart';
import '../fixed/ingredientInfo/ingredientsList.dart';
import '../fixed/ingredientInfo/ingredient.dart';
import '../fixed/ingredientInfo/ingredientChip.dart';

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
                  new Ingredient("새우", 0, false),
                  new Ingredient("식빵", 2, false),
                  new Ingredient("국수", 2, false),
                  new Ingredient("대파", 1, false),
                  new Ingredient("치즈", 4, false),
                  new Ingredient("우유", 4, false),
                  new Ingredient("돼지고기", 0, false),
                  new Ingredient("간장", 3, false),
                  new Ingredient("소금", 3, false),
                  new Ingredient("양파", 1, false),
                ],
              ),
            ),
          ]),
    );
  }
}
