import 'dart:async';
import '../fixed/IngredientInfo/Ingredient.dart';
import '../fixed/IngredientInfo/IngredientChip.dart';

class IngredientBloc{
  final StreamController<Ingredient>controller = StreamController<Ingredient>();

  IngredientBloc(){
    controller.stream.listen(isData);
  }

  void dispose(){
    controller.close();
  }
  void isData(Ingredient data){
    print(data.name);
    checkedIngr.putIfAbsent(data.name, ()=>generateIngr(data));
    print(checkedIngr.keys);
  }

  generateIngr(Ingredient a) {
    return a;
  }

}