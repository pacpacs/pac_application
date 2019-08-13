import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pac_app/bloc/IngredientBloc.dart';
import 'package:pac_app/model/Ingredient.dart';
import 'package:pac_app/model/Category.dart';
import '../fixed/appBar.dart';
import '../fixed/ingredientInfo/ingredientsList.dart';
import '../fixed/ingredientInfo/ingredientChip.dart';

class SelectIngredientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientBloc, IngredientState>(
      bloc: BlocProvider.of<IngredientBloc>(context),
      builder: (context, ingredients) => Scaffold(
        appBar: appBar.getAppBar(context, true),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Wrap(
                  spacing: 4.0,
                  runSpacing: 0.0,
                  children:
                      List.from((ingredients as IngredientLoaded).ingredients)
                          .where((ingredient) => ingredient.isChecked)
                          .map((checkedIngredient) => IngredientChip(
                                ingredient: checkedIngredient,
                              ))
                          .toList()),
              Container(
                child: IngredientsList(),
              ),
            ]),
      ),
    );
  }
}
