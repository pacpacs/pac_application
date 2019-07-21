import 'package:flutter/material.dart';
import 'ingredientSet.dart';

class Ingredient {
  String name;
  final int categoryCode;
  bool isCheck;
  Ingredient(this.name, this.categoryCode, this.isCheck);
  Color getColor() {
    return ingredientSet(this.categoryCode).setColor();
  }
  String getCategoryName(){
    return ingredientSet(this.categoryCode).setCategoryName();
  }
}
