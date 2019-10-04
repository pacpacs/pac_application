import 'package:flutter/material.dart';
import 'package:pac_app/fixed/IngredientInfo/IngredientSet.dart';

class Ingredient {
  String name;
  CategoryCode categoryCodeName;
  bool isCheck;
  Ingredient(this.name, this.categoryCodeName, this.isCheck);

  Color getColor() {
    return ingredientSet(this.categoryCodeName).setColor();
  }
  String getCategoryName(){
    return ingredientSet(this.categoryCodeName).setCategoryName();
  }
}
