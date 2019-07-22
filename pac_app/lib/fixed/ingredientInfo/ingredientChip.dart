import 'package:flutter/material.dart';

import '../../bloc/ingredient_bloc.dart';
import '../ingredientInfo/ingredient.dart';
import 'ingredientSet.dart';

//TODO:checkedIngr의 초기 쓰레기값 없이도 업데이트 할 수 있도록
Map<String, Ingredient> checkedIngr = {'999':Ingredient('default', CategoryCode.ETC, false)};
List<Chip> BBB = [];

class IngredientChip {
  CategoryCode category;
  String ingredientName;
  IngredientChip(this.category, this.ingredientName);


  static generateChipList() {
//TODO:makeDummyList 대신 재료선택bloc에서 Ingredient 가져와서 BBB에 add하기
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
        //TODO:List<Chip>BBB에서 해당 Chip을 삭제하고,
        //Map<String,Ingredient>checkedIngr에서도 해당 재료 찾아서 삭제해서 서버에다가 검색결과 달라고 또 하기
        print('$name 는 삭제되고싶다.');
      },
    );
  }
}
