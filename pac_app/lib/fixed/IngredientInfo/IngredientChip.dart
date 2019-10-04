import 'package:flutter/material.dart';
import 'package:pac_app/fixed/IngredientInfo/Ingredient.dart';
import 'package:pac_app/fixed/IngredientInfo/IngredientSet.dart';
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
        if(snapshot.hasData){
          if(!chipName.contains(snapshot.data.name)) {
            chipList.add(makeChip(snapshot.data));
            chipName.add(snapshot.data.name);
          }else{
            chipName.remove(snapshot.data.name);
            chipList.removeWhere((item) => item.label.toString() == Text(snapshot.data.name).toString());
          }
        }
        print(chipList.length);
        return Wrap(
          spacing: 4.0,
          runSpacing: 0.0,
          children: chipList,
        );

      },
    );
  }

  makeChip (Ingredient data){
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


class ChipListView extends StatelessWidget{

  List<Chip> selectChip = [];
  selectedChip(){
    for (String chip in chipName){
      selectChip.add(
        new Chip(
          label: Text(chip),
        )
      );
    }
    return selectChip;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Wrap(
      spacing: 4.0,
      runSpacing: 0.0,
      children: selectedChip(),
    );
  }

}