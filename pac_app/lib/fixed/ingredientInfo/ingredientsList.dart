import 'package:flutter/material.dart';
import 'ingredientItem.dart';
import 'ingredient.dart';
import '../ingredientChips/ingredientChip.dart';

class IngredientsList extends StatefulWidget {
  Function(List<Ingredient>) makeChipList;
  List<Ingredient> ingredient;
  IngredientsList({this.ingredient, this.makeChipList});
  @override
  _IngredientsListState createState() {
    return new _IngredientsListState();
  }
}

class _IngredientsListState extends State<IngredientsList> {

  Map<String, int> checkedList;
  Map<String ,int> uncheckedList;

  BringCheckState(){

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child : new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Expanded(child: new ListView(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                children: widget.ingredient.map((Ingredient ingredient) {
                  return new IngredientItem(ingredient);
                }).toList(),
              )),
              new RaisedButton(onPressed: () {
                /*for (Product p in widget.product) {
                  if (p.isCheck) {
                  }
                }*/
              },
                child: new Text('Save'),
              )
            ],
          ),
        )
    );
  }
}
