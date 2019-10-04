import 'package:flutter/material.dart';
import 'package:pac_app/fixed/IngredientInfo/Ingredient.dart';
import 'package:pac_app/bloc/MultipleBlocProvider.dart';
Map<String, bool> check = Map<String, bool>();
class IngredientItem extends StatefulWidget{
  final Ingredient ingredient;
  IngredientItem(Ingredient ingredient):
      ingredient = ingredient,
        super(key: new ObjectKey(ingredient));

  @override
  IngredientItemState createState() {
    // TODO: implement createState
    return IngredientItemState();
  }
}
class IngredientItemState extends State<IngredientItem> {

  checkState(){
    if(!check.containsKey(widget.ingredient.name)) check[widget.ingredient.name] = false;
    return check[widget.ingredient.name];
  }
  @override
  Widget build(BuildContext context) {
    return new ListTile(
        onTap:(){
          MultipleBlocProvider.of(context).ingredientBloc.setActive(widget.ingredient);
        },
        leading: new CircleAvatar(
          backgroundColor: widget.ingredient.getColor(),
          radius: 10.0,
        ),
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(widget.ingredient.name)),
//            new Checkbox(value: checkState(),
//                onChanged: (bool value) {
//              setState(() {
//                check[widget.ingredient.name] = value;
//                MultipleBlocProvider.of(context).ingredientBloc.setActive(tagWithIngredient(value, widget.ingredient));
//              });
//            })
          ],
        )
    );
  }
}

