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
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //TODO : 공통되게 사용하는 색깔 fixed 따로 빼야하지 않을까?
                    new FloatingActionButton(
                        heroTag: "btn1",
                        backgroundColor: Colors.red.shade800,
                        onPressed: (){},
                        child: new Text("육류")),
                    new FloatingActionButton(
                        heroTag: "btn2",
                        backgroundColor: Colors.green.shade900,
                        onPressed: (){},
                        child: new Text("채소")),
                    new FloatingActionButton(
                        heroTag: "btn3",
                        backgroundColor: Colors.brown,
                        onPressed: (){},
                        child: new Text("곡물")),
                    new FloatingActionButton(
                        heroTag: "btn4",
                        backgroundColor: Colors.deepOrangeAccent[100],
                        onPressed: (){},
                        child: new Text("양념")),                        
                    new FloatingActionButton(
                        heroTag: "btn5",
                        backgroundColor: Colors.black,
                        onPressed: (){},
                        child: new Text("기타")),
              ],),
              new Expanded(child: new GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 4,
                //padding: new EdgeInsets.symmetric(vertical: 8.0),
                children: widget.ingredient.where((ingredient)=>ingredient.categoryCode != 0).map((Ingredient ingredient) {
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
