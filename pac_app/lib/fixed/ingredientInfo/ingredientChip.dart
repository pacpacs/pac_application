import 'package:flutter/material.dart';

import 'package:pac_app/model/Ingredient.dart';
import 'package:pac_app/model/Category.dart';

//TODO:checkedIngr의 초기 쓰레기값 없이도 업데이트 할 수 있도록
//????????????
class IngredientChip  extends StatelessWidget{
  Ingredient ingredient;
  IngredientChip({this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: this.ingredient.category.color
      ),
      label: Text(ingredient.name),
      onDeleted: () {
        print('${ingredient.name} 는 삭제되고싶다.');
      },
    );
  }
}
