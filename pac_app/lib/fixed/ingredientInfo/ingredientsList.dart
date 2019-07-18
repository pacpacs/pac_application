import 'package:flutter/material.dart';
import 'ingredientItem.dart';
import 'ingredient.dart';
import '../ingredientChips/ingredientChip.dart';
import '../../main.dart';

class IngredientsList extends StatefulWidget {
  List <Ingredient> ingredient;
  IngredientsList({this.ingredient});
  @override
  _IngredientsListState createState() {
    return new _IngredientsListState();
  }
}


class _IngredientsListState extends State<IngredientsList> {

  Map<String, int> checkedList;
  Map<String ,int> uncheckedList;

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
                children: widget.ingredient.where((ingredient)=>ingredient.categoryCode == [1,2]).map((Ingredient ingredient) {
                  return IngredientItem(ingredient);
                }).toList(),
              )),
              new RaisedButton(              
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return MyHomePage();
                    }
                  )
                );
              },
                child: new Text('Save'),
              )
            ],
          ),
        )
    );
  }

}
