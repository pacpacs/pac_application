import 'package:flutter/material.dart';

import '../../bloc/ingredient_bloc.dart';
import '../ingredientInfo/ingredient.dart';

//TODO:checkedIngr의 초기 쓰레기값 없이도 업데이트 할 수 있도록
Map<String, Ingredient> checkedIngr = {'999':Ingredient('default', 999, false)};
List<Chip> BBB = [];

class IngredientChip {
  int chipCategoryCode;
  String ingredientName;
  IngredientChip(this.chipCategoryCode, this.ingredientName);

  Color _setHeadColor(int code) {
    switch (code) {
      case 1: //육류
        return Colors.red.shade800;
        break;
      case 2: //채소
        return Colors.green.shade900;
        break;
      case 3: //밥빵면류
        return Colors.brown;
        break;
      case 4: //향신료
        return Colors.deepOrangeAccent.shade100;
        break;
      default:
        return Colors.black;
    }
  }

  static generateChipList() {
//TODO:makeDummyList 대신 재료선택bloc에서 Ingredient 가져와서 BBB에 add하기
    checkedIngr.forEach((key, value) => BBB.add(generateIngredientChip(value.categoryCode, value.name)));
    
    return BBB;
  }

  static generateIngredientChip(int category, String name) {
    IngredientChip generated = IngredientChip(category, name);
    return new Chip(
      avatar: CircleAvatar(
        backgroundColor: generated._setHeadColor(category),
      ),
      label: Text(name),
      onDeleted: () {
        //TODO:List<Chip>BBB에서 해당 Chip을 삭제하고,
        //List<Ingredient>AAA에서도 해당 재료 찾아서 삭제해서 서버에다가 검색결과 달라고 또 하기
        print('$name 는 삭제되고싶다.');
      },
    );
  }
}
