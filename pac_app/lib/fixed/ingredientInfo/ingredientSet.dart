import 'package:flutter/material.dart';

enum categoryCode { meat, vegitable, grain, seasoning, etc }
//TODO : Enum이 constant 
class ingredientSet {
  categoryCode code; 
  ingredientSet(this.code);
  setColor() {
    switch (this.code) {
      case categoryCode.meat: //육류
        return Colors.red.shade800;
        break;
      case categoryCode.vegitable: //채소
        return Colors.green.shade900;
        break;
      case categoryCode.grain: //탄수화물
        return Colors.brown;
        break;
      case categoryCode.seasoning: //향신료
        return Colors.deepOrangeAccent[100];
        break;
      default:
        return Colors.black;
    }
  }

  setCategoryName() {
    switch (this.code) {
      case categoryCode.meat: //육류
        return "육류";
        break;
      case categoryCode.vegitable: //채소
        return "채소";
        break;
      case categoryCode.grain: //탄수화물
        return "곡물";
        break;
      case categoryCode.seasoning: //향신료
        return "양념";
        break;
      default:
        return "기타";
    }
  }
}
