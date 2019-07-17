import 'dart:async';
import '../fixed/ingredientInfo/ingredient.dart';

class IngredientBloc{
  final StreamController<String>controller = StreamController<String>();

  IngredientBloc(){
    controller.stream.listen(isData);
  }

  void dispose(){
    controller.close();
  }
  void isData(data){
    print(data);
  }
}