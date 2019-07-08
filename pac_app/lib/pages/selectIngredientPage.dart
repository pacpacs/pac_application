import 'package:flutter/material.dart';
import '../../fixed/appBar.dart';
import '../../fixed/bottomNavigator.dart';
import 'ingredientsList.dart';
import 'ingredient.dart';
import '../../fixed/ingredientChips.dart';
class Ingredients extends StatefulWidget {
  @override
  _IngredientsState createState() => new _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {

  List<Product> _productList;

  List<ingredientChip> _chips
  MakeChipList(List<Product> productList){
    setState(() {
      _productList = productList;
      _chips= ingredients.getIngredientChip(_productList)
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBar.getAppBar(context, ''),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 30, left:30, top: 15, bottom: 15),
              child: TextField( //검색 창
                style: TextStyle(
                    fontSize:12.0,
                    height: 0.5,
                    color: const Color(0xFF000000),
                    fontFamily: "Roboto"
                ),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:const BorderRadius.all(
                            const Radius.circular(50.0)
                        )
                    ),
                    hintText: 'gone'
                ),
                onChanged: (String a){
                  print('changed to ' + a);
                },
              ),
            ),
            Wrap(
              spacing: 4.0,
              runSpacing: 0.0,
              children:_chips
              //ingredientChip.generateIngredientChip(1, "")
            ),
            new Container(
              //ToDo : chip list수정하는 곳.. Chip 상태만 바꾸면 되네
                child: new IngredientsList(
                  makeChip : MakeChipList,
                  product : [new Product("name", Colors.red, true),],
                )
            )
          ]),
      bottomNavigationBar: BottomNavigator(),
    );
  }

}

