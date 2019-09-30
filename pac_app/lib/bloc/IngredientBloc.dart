import 'dart:async';
import 'package:pac_app/fixed/IngredientInfo/Ingredient.dart';
import 'package:bloc_provider/bloc_provider.dart';
//class tagWithIngredient{
//  bool tag;
//  Ingredient ingredient;
//  tagWithIngredient(this.tag, this.ingredient);
//}
class IngredientBloc extends Bloc{
  final _active = StreamController<dynamic>.broadcast();

  Stream<dynamic> get getActive => _active.stream;

  Function(Ingredient) get setActive => _active.sink.add;

  IngredientBloc(){
    init();
    //controller.stream.listen((data){IngredientChip();});
  }

  init(){

  }
  void dispose(){
    _active.close();
  }
}