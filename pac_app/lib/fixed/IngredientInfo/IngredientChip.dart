import 'package:flutter/material.dart';
import 'Ingredient.dart';
import 'IngredientSet.dart';
import 'package:pac_app/bloc/MultipleBlocProvider.dart';

//TODO:checkedIngr의 초기 쓰레기값 없이도 업데이트 할 수 있도록
List<Chip> chipList = [];
List<String> chipName = [];
class IngredientChip extends StatefulWidget{

  @override
  _IngredientChipState createState() => new _IngredientChipState();
}

class _IngredientChipState extends State<IngredientChip>{
  @override
  bool check = false;

  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: MultipleBlocProvider.of(context).ingredientBloc.getActive,
      builder: (context,snapshot){
        print("chip\n");
        if(snapshot.hasData){
          if(!chipName.contains(snapshot.data.name)) {
            chipList.add(makeChip(snapshot.data));
            chipName.add(snapshot.data.name);
          }else{
            chipName.remove(snapshot.data.name);
            chipList.removeWhere((item) => item.label.toString() == Text(snapshot.data.name).toString());
          }
        }
        return Wrap(
          spacing: 4.0,
          runSpacing: 0.0,
          children: chipList,
        );
      },
    );
  }

  makeChip(var data){
    return new Chip(
      avatar: CircleAvatar(
        backgroundColor: ingredientSet(data.categoryCodeName).setColor(),
      ),
      label: Text(data.name),
      onDeleted: (){
        setState(() {
          MultipleBlocProvider.of(context).ingredientBloc.setActive(data);
        });
      },

    );
  }
}


