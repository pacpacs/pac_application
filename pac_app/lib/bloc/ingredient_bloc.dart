import 'dart:async';
import '../fixed/ingredientInfo/ingredient.dart';

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
  }
}