import 'package:flutter/material.dart';
import 'package:pac_app/fixed/IngredientInfo/IngredientItem.dart';
import 'package:pac_app/fixed/IngredientInfo/Ingredient.dart';
import 'package:pac_app/fixed/IngredientInfo/IngredientSet.dart';

class IngredientsList extends StatefulWidget {
  List<Ingredient> ingredient;
  IngredientsList(this.ingredient);
  @override
  _IngredientsListState createState() {
    return new _IngredientsListState();
  }
}

class _IngredientsListState extends State<IngredientsList> {
  Map<String, int> checkedList;
  Map<String, int> uncheckedList;
  var but= [true, true, true, true, true, true, true];

  @override
  //TODO : CatecoryCode에 배정할 숫자 Enum으로 바꿀 예정
  Widget build(BuildContext context) {
    bool buttonEvent(Ingredient ingredient) {
      for(var code in CategoryCode.values){
        if(but[code.index] && ingredient.categoryCodeName == code)
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
              for (var codeNumber in CategoryCode.values)(
                new FloatingActionButton(
                  mini: true,
                  heroTag: "btn"+codeNumber.index.toString(),
                  //color: (isBackButtonActivated) ? Colors.green : Colors.red,
                  backgroundColor: ingredientSet(codeNumber).setColor(),
                  child: new Text(ingredientSet(codeNumber).setCategoryName()),
                  onPressed:(){                    
                    setState(() {
                      but[codeNumber.index] = !but[codeNumber.index];
                    });
                  },
                )
              )
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
        ],
      ),
    ));
  }
}
