import 'package:flutter/material.dart';

enum CategoryCode { MEAT, SEAFOOD, VEGITABLE, FRUIT, GRAIN, SEASONING, ETC }
//TODO : Enum이 constant 
class ingredientSet {
  CategoryCode code;

  ingredientSet(this.code);

  setColor() {
    switch (this.code) {
      case CategoryCode.MEAT: //육류
        return Colors.red.shade800;
        break;
      case CategoryCode.SEAFOOD: //해산물
        return Colors.lightBlueAccent;
        break;
      case CategoryCode.VEGITABLE: //채소
        return Colors.green.shade900;
        break;
      case CategoryCode.FRUIT: //과일
        return Colors.amber;
        break;
      case CategoryCode.GRAIN: //곡물
        return Colors.brown;
        break;
      case CategoryCode.SEASONING: //향신료
        return Colors.deepOrangeAccent[100];
        break;
      default://기타
        return Colors.black;
    }
  }

  setCategoryName() {
    switch (this.code) {
      case CategoryCode.MEAT: //육류
        return "육류";
        break;
      case CategoryCode.SEAFOOD: //해산물
        return "해산물";
        break;
      case CategoryCode.VEGITABLE: //채소
        return "채소";
        break;
      case CategoryCode.FRUIT: //과일
        return "과일";
        break;
      case CategoryCode.GRAIN: //탄수화물
        return "곡물";
        break;
      case CategoryCode.SEASONING: //향신료
        return "양념";
        break;
      default:
        return "기타";
    }
  }
}
