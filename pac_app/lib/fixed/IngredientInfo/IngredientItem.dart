import 'package:flutter/material.dart';
import 'package:pac_app/fixed/IngredientInfo/IngredientChip.dart' as prefix0;
import 'Ingredient.dart';
import '../../bloc/MultipleBlocProvider.dart';
import '../../bloc/IngredientBloc.dart';
import 'IngredientChip.dart';
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
          backgroundColor: widget.ingredient.getColor(),
          radius: 10.0,
        ),
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(widget.ingredient.name)),
            new Checkbox(value: widget.ingredient.isCheck, onChanged: (bool value) {
              setState(() {
                widget.ingredient.isCheck = value;
                MultipleBlocProvider.of(context).ingredientBloc.setIngredient(widget.ingredient);
              });
            })
          ],
        )
    );
  }
}

