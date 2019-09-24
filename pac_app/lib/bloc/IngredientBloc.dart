import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../fixed/ingredientInfo/ingredient.dart';
import '../fixed/ingredientInfo/ingredientChip.dart';
import 'package:bloc_provider/bloc_provider.dart';

class IngredientBloc implements Bloc{
 final  _checkedIngr = BehaviorSubject<Map<String, Ingredient>>();
 
 Stream<Map<String, Ingredient>> get currentUser => _checkedIngr.stream;
  Map<String, Ingredient> get getCurrentUserData => _checkedIngr.value;

  void addIngredient(Ingredient data){
    checkedIngr.putIfAbsent(data.name, ()=>generateIngr(data));
  }

 void removeIngredient(Ingredient data){
    checkedIngr.remove(data.name);
  }

  generateIngr(Ingredient ingredient) {
    return Ingredient(ingredient.name, ingredient.categoryCodeName, false);
  }

  @override
  void dispose() {
    _checkedIngr.close();
  }

}