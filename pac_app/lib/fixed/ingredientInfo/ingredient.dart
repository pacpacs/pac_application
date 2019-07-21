import 'package:flutter/material.dart';

enum categoryCodeNumber { meat, vegitable, grain, seasoning, etc }

class Ingredient {
  String name;
  int categoryCode;
  bool isCheck;
  Ingredient(this.name, this.categoryCode, this.isCheck);
  setColor() {
    int code = this.categoryCode;
    switch (code) {
      case 0: //육류
        return Colors.red.shade800;
        break;
      case 1: //채소
        return Colors.green.shade900;
        break;
      case 2: //탄수화물
        return Colors.brown;
        break;
      case 3: //향신료
        return Colors.deepOrangeAccent[100];
        break;
      default:
        return Colors.black;
    }
  }
  setCategory(){
    int code = this.categoryCode;
    switch(code){
      case 0: //육류
        return "육류";
        break;
      case 1: //채소
        return "채소";
        break;
      case 2: //탄수화물
        return "곡물";
        break;
      case 3: //향신료
        return "양념";
        break;
      default:
        return "기타";
    }
  }
}
