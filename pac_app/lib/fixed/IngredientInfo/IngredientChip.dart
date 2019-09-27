import 'package:flutter/material.dart';
import 'Ingredient.dart';
import 'IngredientSet.dart';
import '../../bloc/MultipleBlocProvider.dart';
import '../../bloc/IngredientBloc.dart';
import 'package:collection/collection.dart';

//TODO:checkedIngr의 초기 쓰레기값 없이도 업데이트 할 수 있도록
List<Chip> chipList = [];
List<String> chipName = [];
class IngredientChip extends StatefulWidget{

  @override
  _IngredientChipState createState() => new _IngredientChipState();
}

class _IngredientChipState extends State<IngredientChip>{
  @override

  Widget build(BuildContext context) {

    return StreamBuilder<Ingredient>(
      stream: MultipleBlocProvider.of(context).ingredientBloc.getIngredient,
      builder: (context, snapshot) {
        if (snapshot.hasData && !chipName.contains(snapshot.data.name)) {
          chipList.add(makeChip(snapshot.data));
          chipName.add(snapshot.data.name);
        }

        return Wrap(
          spacing: 4.0,
          runSpacing: 0.0,
          children: chipList,
        );
      }
    );
  }

  makeChip(var data){
    return new Chip(
      avatar: CircleAvatar(
        backgroundColor: ingredientSet(data.categoryCodeName).setColor(),
      ),
      label: Text(data.name),
    );
  }
}


