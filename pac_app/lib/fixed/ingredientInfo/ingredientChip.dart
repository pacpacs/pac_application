import 'package:flutter/material.dart';
import 'package:pac_app/bloc/BlocProvider.dart';

import '../../bloc/IngredientBloc.dart';
import '../ingredientInfo/ingredient.dart';
import 'ingredientSet.dart';

//TODO:checkedIngr의 초기 쓰레기값 없이도 업데이트 할 수 있도록
Map<String,Ingredient> checkedIngr={};
List<Chip> BBB = [];

class IngredientChip {
  CategoryCode category;
  String ingredientName;
  IngredientChip(this.category, this.ingredientName);


  static generateChipList() {
//TODO:makeDummyList 대신 재료선택bloc에서 Ingredient 가져와서 BBB에 add하기
    BBB=[];
    checkedIngr.forEach((key, value) => BBB.add(generateIngredientChip(value.categoryCodeName, value.name)));
    
    return BBB;
  }

  static generateIngredientChip(CategoryCode category, String name) {
    IngredientChip generated = IngredientChip(category, name);
    return new Chip(
      avatar: CircleAvatar(
        backgroundColor: ingredientSet(generated.category).setColor(),
      ),
      label: Text(name),
      onDeleted: () {
        Ingredient ingredient = Ingredient(name,category,false);
        IngredientBloc().removeIngredient(ingredient);
      },
    );
  }
}
