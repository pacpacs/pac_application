import 'package:flutter/material.dart';

import '../ingredientInfo/ingredient.dart';

//TODO:리스트 아니고 맵이어야함.  그래?

//List<Ingredient> AAA = [];
Map<String, Chip> AAA = {};
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

  static void makeDummyList() {
    for (int i = 0; i < 15; i++) {
      String stringI = i.toString();
      //AAA.map( (stringI)=>generateIngredientChip(i%4, string));
      AAA.putIfAbsent(i.toString(), ()=>generateIngredientChip(i%4, stringI));
    }
  }

  static generateChipList() {
//TODO:makeDummyList 대신 재료선택bloc에서 Ingredient 가져와서 AAA에 add하기
    makeDummyList();
    for(int i=0;i<AAA.length;i++){
      //AAA내용을 BBB에 담아줘야함
      AAA.forEach((key, value)=>( BBB.add(value) ));
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
        //TODO:List<Chip>BBB에서 해당 Chip을 삭제하고,
        //List<Ingredient>AAA에서도 해당 재료 찾아서 삭제해서 서버에다가 검색결과 달라고 또 하기
        print('$name 는 삭제되고싶다.');
      },
    );
  }
}
