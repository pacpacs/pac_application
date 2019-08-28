import 'package:flutter/material.dart';

enum CategoryCode { MEAT, VEGITABLE, GRAIN, SEASONING, ETC }
//TODO : Enum이 constant 
class ingredientSet {
  CategoryCode code;

  ingredientSet(this.code);
  setColor() {
    switch (this.code) {
      case CategoryCode.MEAT: //육류
        return Colors.red.shade800;
        break;
      case CategoryCode.VEGITABLE: //채소
        return Colors.green.shade900;
        break;
      case CategoryCode.GRAIN: //탄수화물
        return Colors.brown;
        break;
      case CategoryCode.SEASONING: //향신료
        return Colors.deepOrangeAccent[100];
        break;
      default:
        return Colors.black;
    }
  }

  setCategoryName() {
    switch (this.code) {
      case CategoryCode.MEAT: //육류
        return "육류";
        break;
      case CategoryCode.VEGITABLE: //채소
        return "채소";
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
