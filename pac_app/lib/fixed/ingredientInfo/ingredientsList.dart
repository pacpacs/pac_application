import 'package:flutter/material.dart';
import 'ingredientItem.dart';
import 'ingredient.dart';
import '../ingredientInfo/ingredientChip.dart';
import '../../main.dart';
import '../../pages/searchResultPage.dart';
import 'ingredientSet.dart';

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
  var but= [true, true, true, true, true];

  @override
  //TODO : CatecoryCode에 배정할 숫자 Enum으로 바꿀 예정
  Widget build(BuildContext context) {
    bool buttonEvent(Ingredient ingredient) {
      for(int butNum = 0; butNum < 5; butNum++){
        if(but[butNum] && ingredient.categoryCode == butNum)
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
              //TODO : FloatingActionButton For문 하나로 묶어서 생성 예정
              for(int butNum = 0; butNum< categoryCodeNumber.values.length; butNum++)(
                new FloatingActionButton(
                  mini: true,
                  heroTag: "btn"+butNum.toString(),
                  backgroundColor: ingredientSet(butNum).setColor(),
                  child: new Text(ingredientSet(butNum).setCategoryName()),
                  onPressed:(){                    
                    setState(() {
                      but[butNum] = !but[butNum];
                    });
                  },
                )
              ),
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
          //TODO : 클릭시 결과 화면으로 넘어가야함.
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return searchResultPage();
              }));
            },
            child: new Text('검색'),
          )
        ],
      ),
    ));
  }
}
