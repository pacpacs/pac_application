import 'package:flutter/material.dart';
import 'ingredientSet.dart';

class Ingredient {
  String name;
  categoryCode categoryCodeName;
  bool isCheck;
  Ingredient(this.name, this.categoryCodeName, this.isCheck);
  Color getColor() {
    return ingredientSet(this.categoryCodeName).setColor();
  }
  String getCategoryName(){
    return ingredientSet(this.categoryCodeName).setCategoryName();
  }
}
