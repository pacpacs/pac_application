import 'dart:async';
import '../fixed/IngredientInfo/Ingredient.dart';
import 'package:bloc_provider/bloc_provider.dart';
import '../fixed/IngredientInfo/IngredientChip.dart';
class IngredientBloc extends Object{
  final controller = StreamController<Ingredient>.broadcast();
  Stream<dynamic> get getIngredient => controller.stream;
  Function(Ingredient) get setIngredient => controller.sink.add;

  IngredientBloc(){
    init();
    //controller.stream.listen((data){IngredientChip();});
  }

  init(){

  }
  void dispose(){
    controller.close();
  }
}