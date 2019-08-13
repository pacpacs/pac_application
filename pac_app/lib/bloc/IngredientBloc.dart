import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pac_app/model/Ingredient.dart';
import 'package:pac_app/model/Category.dart';
import 'package:meta/meta.dart';

@immutable
abstract class IngredientEvent {}

class IngredientCheckEvent extends IngredientEvent {
  final String name;
  final bool value;
  IngredientCheckEvent({@required this.name, @required this.value});
}

@immutable
abstract class IngredientState extends Equatable {
  IngredientState([List props = const []]) : super(props);
}

class IngredientLoaded extends IngredientState {
  final List<Ingredient> ingredients;
  IngredientLoaded([this.ingredients = const []]);
  @override
  String toString() => 'IngredientsLoaded { ingredients: $ingredients }';
}

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  @override
  IngredientState get initialState => IngredientLoaded([
        Ingredient(
            name: "새우", category: Category.categoryList[CategoryType.MEAT]),
        Ingredient(
            name: "식빵", category: Category.categoryList[CategoryType.GRAIN]),
        Ingredient(
            name: "국수", category: Category.categoryList[CategoryType.GRAIN]),
        Ingredient(
            name: "대파",
            category: Category.categoryList[CategoryType.VEGETABLE]),
        Ingredient(
            name: "치즈", category: Category.categoryList[CategoryType.ETC]),
        Ingredient(
            name: "우유", category: Category.categoryList[CategoryType.ETC]),
        Ingredient(
            name: "돼지고기", category: Category.categoryList[CategoryType.MEAT]),
        Ingredient(
            name: "간장",
            category: Category.categoryList[CategoryType.SEASONING]),
        Ingredient(
            name: "소금",
            category: Category.categoryList[CategoryType.SEASONING]),
        Ingredient(
            name: "양파",
            category: Category.categoryList[CategoryType.VEGETABLE]),
      ]);

  @override
  Stream<IngredientState> mapEventToState(IngredientEvent event) async* {
    switch (event.runtimeType) {
      case IngredientCheckEvent:
        yield* _mapToUpdateCheckEvent(event);

        break;
    }
  }

  Stream<IngredientState> _mapToUpdateCheckEvent(
      IngredientCheckEvent event) async* {
    if (currentState.runtimeType == IngredientLoaded) {
      final List<Ingredient> updatedIngredients =
          List.from((currentState as IngredientLoaded)
              .ingredients
              .map((ingredient) => {
                    ingredient.isChecked = ingredient.name == event.name
                        ? event.value
                        : ingredient.isChecked
                  })
              .toList());
      yield IngredientLoaded(updatedIngredients);
    }
  }
}
