import 'package:flutter/material.dart';
import 'ingredientItem.dart';
import 'ingredient.dart';
import '../ingredientChips/ingredientChip.dart';
import '../../main.dart';

class IngredientsList extends StatefulWidget {
  List<Ingredient> ingredient;
  IngredientsList({this.ingredient});
  @override
  _IngredientsListState createState() {
    return new _IngredientsListState();
  }
}

class _IngredientsListState extends State<IngredientsList> {
  Map<String, int> checkedList;
  Map<String, int> uncheckedList;
  bool but1 = true, but2 = true, but3 = true, but4 = true, but5 = true;

  @override
  Widget build(BuildContext context) {
    bool buttonEvent(Ingredient ingredient) {
      if ((but1 && ingredient.categoryCode == 1) ||
          (but2 && ingredient.categoryCode == 2) ||
          (but3 && ingredient.categoryCode == 3) ||
          (but4 && ingredient.categoryCode == 4) ||
          (but5 && ingredient.categoryCode == 5)) {
        return true;
      }
      return false;
    }

    return Expanded(
        child: new Container(
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
                  onPressed: () {
                    setState(() {
                      this.but1 = !but1;
                    });
                  },
                  child: new Text("육류")),
              new FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: Colors.green.shade900,
                  onPressed: () {
                    setState(() {
                      this.but2 = !but2;
                    });
                  },
                  child: new Text("채소")),
              new FloatingActionButton(
                  heroTag: "btn3",
                  backgroundColor: Colors.brown,
                  onPressed: () {
                    setState(() {
                      this.but3 = !but3;
                    });
                  },
                  child: new Text("곡물")),
              new FloatingActionButton(
                  heroTag: "btn4",
                  backgroundColor: Colors.deepOrangeAccent[100],
                  onPressed: () {
                    setState(() {
                      this.but4 = !but4;
                    });
                  },
                  child: new Text("양념")),
              new FloatingActionButton(
                  heroTag: "btn5",
                  backgroundColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      this.but5 = !but5;
                    });
                  },
                  child: new Text("기타")),
            ],
          ),
          new Expanded(
              child: new GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 4,
            //padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: widget.ingredient
                .where((ingredient) => buttonEvent(ingredient))
                .map((Ingredient ingredient) {
              return IngredientItem(ingredient);
            }).toList(),
          )),
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return MyHomePage();
              }));
            },
            child: new Text('Save'),
          )
        ],
      ),
    ));
  }
}
