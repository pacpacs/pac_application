import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pac_app/bloc/IngredientBloc.dart';
import 'ingredientItem.dart';
import 'package:pac_app/model/Ingredient.dart';
import '../ingredientInfo/ingredientChip.dart';
import '../../main.dart';
import '../../pages/searchResultPage.dart';
import 'package:pac_app/model/Category.dart';

class IngredientsList extends StatefulWidget {
  @override
  _IngredientsListState createState() {
    return _IngredientsListState();
  }
}

class _IngredientsListState extends State<IngredientsList> {
  Map<String, int> checkedList;
  Map<String, int> uncheckedList;
  var but = [true, true, true, true, true];

  @override
  //TODO : CatecoryCode에 배정할 숫자 Enum으로 바꿀 예정
  Widget build(BuildContext context) {
    bool buttonEvent(Ingredient ingredient) {
      for (var code in CategoryType.values) {
        if (but[code.index] && ingredient.category.type == code) return true;
      }
      return false;
    }

    final IngredientBloc ingredientBloc =
        BlocProvider.of<IngredientBloc>(context);
    return BlocBuilder<IngredientBloc,IngredientState>(
      bloc: ingredientBloc,
      builder: (context, ingredients) => Expanded(
          child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: CategoryType.values
                  .map((categoryType) => FloatingActionButton(
                        mini: true,
                        heroTag: "btn" + categoryType.index.toString(),
                        backgroundColor:
                            Category.categoryList[categoryType].color,
                        child: Text(Category.categoryList[categoryType].name),
                        onPressed: () {
                          setState(() {
                            but[categoryType.index] = !but[categoryType.index];
                          });
                        },
                      ))
                  .toList(),
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 4,
              children: List.from((ingredients as IngredientLoaded).ingredients)
                  .where((ingredient) => buttonEvent(ingredient))
                  .map((ingredient) => IngredientItem(
                      ingredient: ingredient,
                      action: (bool value) {
                        print("checking"+ingredient.name+ingredient.isChecked.toString());
                       ingredientBloc.dispatch(IngredientCheckEvent(
                            name: ingredient.name, value: !ingredient.isChecked));
                      }))
                  .toList(),
            )),
            //TODO : 클릭시 결과 화면으로 넘어가야함.
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return searchResultPage();
                }));
              },
              child: Text('검색'),
            )
          ],
        ),
      )),
    );
  }
}
