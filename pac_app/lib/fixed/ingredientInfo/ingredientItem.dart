import 'package:flutter/material.dart';
import 'ingredient.dart';
import 'ingredientsList.dart';
import '../../bloc/ingredient_bloc.dart';
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

  //TODO : code와 Color설정 부분 새로 파일로 빼야함.
  Color _setColor(int code){
    switch(code){
      case 1://육류
        return Colors.red.shade800;
        break;
      case 2://채소
        return Colors.green.shade900;
        break;
      case 3://탄수화물
        return Colors.brown;
        break;
      case 4://향신료
        return Colors.deepOrangeAccent[100];
        break;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        onTap:null,
        leading: new CircleAvatar(
          backgroundColor: _setColor(widget.ingredient.categoryCode),
          radius: 10.0,
        ),
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(widget.ingredient.name)),
            new Checkbox(value: widget.ingredient.isCheck, onChanged: (bool value) {
              setState(() {
                widget.ingredient.isCheck = value;
                IngredientBloc().controller.add(widget.ingredient);
              });
            })
          ],
        )
    );
  }
}

