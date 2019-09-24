import 'package:flutter/material.dart';

import 'ingredient.dart';

import '../../bloc/IngredientBloc.dart';
class IngredientItem extends StatefulWidget{
  final Ingredient ingredient;
  IngredientItem(Ingredient ingredient):
      ingredient = ingredient,
        super(key: new ObjectKey(ingredient));
  @override
  IngredientItemState createState() {
    return new IngredientItemState(ingredient);
  }
}
class IngredientItemState extends State<IngredientItem> {
  final Ingredient ingredient;
  IngredientItemState(this.ingredient);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        onTap:null,
        leading: new CircleAvatar(
          backgroundColor: ingredient.getColor(),
          radius: 10.0,
        ),
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(ingredient.name)),
            Checkbox(value: ingredient.isCheck, onChanged: (bool value) {
              setState(() {
                widget.ingredient.isCheck = value;
                if(value){
                  IngredientBloc().addIngredient(widget.ingredient);  
                }else{
                  IngredientBloc().removeIngredient(widget.ingredient);
                }              
              });
            })
          ],
        )
    );
  }
}

