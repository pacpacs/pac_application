import 'package:flutter/material.dart';
import '../fixed/appBar.dart';
import '../fixed/bottomNavigator.dart';
import '../fixed/ingredientInfo/ingredientsList.dart';
import '../fixed/ingredientInfo/ingredient.dart';
import '../fixed/ingredientInfo/ingredientItem.dart';
import '../fixed/ingredientChips/ingredientChip.dart';

class selectTabPage extends StatefulWidget{
  _selectTabPageState createState() => _selectTabPageState();
}

class _selectTabPageState extends State<selectTabPage>{
  Widget build(BuildContext context){
    return new Container(
                    //ToDo : chip list수정하는 곳.. Chip 상태만 바꾸면 되네
                    child: new IngredientsList(
                  makeChipList: MakeChipList,
                  ingredient: [
                    new Ingredient("새우", 1, false),
                    new Ingredient("식빵", 3, false),
                    new Ingredient("대파", 2, false),
                    new Ingredient("치즈", 5, false),
                    new Ingredient("우유", 5, false),
                    new Ingredient("돼지고기", 1, false),
                    new Ingredient("간장", 4, false),
                    new Ingredient("소금", 4, false),
                    new Ingredient("양파", 2, false),
                  ],
                ));
  }
}