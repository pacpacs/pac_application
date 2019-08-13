import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pac_app/bloc/IngredientBloc.dart';
import 'package:pac_app/model/Ingredient.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;
  final Function(bool) action;
  IngredientItem({@required this.ingredient, @required this.action})
      : super(key: new ObjectKey(ingredient));

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      leading: CircleAvatar(
        backgroundColor: ingredient.category.color,
        radius: 10.0,
      ),
      title: Row(
        children: <Widget>[
          Expanded(child: Text(ingredient.name)),
          Checkbox(value: ingredient.isChecked, onChanged: action)
        ],
      ),
    );
  }
}
