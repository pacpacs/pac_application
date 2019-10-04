import 'dart:async';
import 'package:pac_app/fixed/IngredientInfo/Ingredient.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
//class tagWithIngredient{
//  bool tag;
//  Ingredient ingredient;
//  tagWithIngredient(this.tag, this.ingredient);
//}
class IngredientBloc extends Bloc{
  final _active = BehaviorSubject<Ingredient>();

  Stream<Ingredient> get getActive => _active.stream;

  Function(Ingredient) get setActive => _active.sink.add;

  IngredientBloc(){
    init();
    //controller.stream.listen((data){IngredientChip();});
  }

  init(){
  }
  void dispose(){
    // _active.close();
  }
}