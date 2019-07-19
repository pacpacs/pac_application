import 'package:flutter/material.dart';

import '../ingredientInfo/ingredient.dart';

//TODO:리스트 아니고 맵이어야함.

List<Ingredient> AAA = [];
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
  //여기서 chipCategoryCode가 null이라서 미쳐버림
  //IngredientChip._setHeadColor(chipCategoryCode);


  static void makeDummyList() {
    for (int i = 0; i < 15; i++) {
      AAA.add(Ingredient('A', 1, true));
    }
  }

//더미 대신 재료선택 StreamBuilder에서 Ingredient 가져와서 AAA에 add하면 됨
  static generateChipList() {
    makeDummyList();

    for (Ingredient ingr in AAA) {
      BBB.add(generateIngredientChip(ingr.categoryCode, ingr.name));
    }
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
        print('$name 는 삭제되고싶다.');
      },
    );
  }
}
