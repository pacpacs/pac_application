import 'package:flutter/material.dart';
import '../fixed/appBar.dart';
import '../fixed/bottomNavigator.dart';
import '../fixed/ingredientInfo/ingredientsList.dart';
import '../fixed/ingredientInfo/ingredient.dart';
import '../fixed/ingredientInfo/ingredientItem.dart';
import '../fixed/ingredientChips/ingredientChip.dart';

class selectIngredientPage extends StatefulWidget {
  @override
  _selectIngredientPageState createState() => new _selectIngredientPageState();
}

class _selectIngredientPageState extends State<selectIngredientPage>
    with SingleTickerProviderStateMixin {
  List<Ingredient> _ingredient;
  TabController _tabController;
  //List<Chip> _chips;

  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  MakeChipList(List<Ingredient> ingredient) {
    setState(() {
      _ingredient = ingredient;
      //_chips= ingredients.getIngredientChip(_productList)
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
            Flexible(
              flex: 1,
              child: TextField(
                //검색 창
                style: TextStyle(
                    fontSize: 12.0,
                    height: 0.5,
                    color: const Color(0xFF000000),
                    fontFamily: "Roboto"),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(50.0))),
                    hintText: 'gone'),
                onChanged: (String a) {
                  print('changed to ' + a);
                },
              ),
            ),
            Flexible(
                flex: 1,
                //children:_chips
                child: ingredientChip.generateChipList()),
            Flexible(
              flex: 5,
              child: new Column(
              children: [
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: "First"),
                  Tab(text: "Second"),
                ],
              ),
              Expanded(
                  child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  new Text("data")
                  /*new Container(
                    //ToDo : chip list수정하는 곳.. Chip 상태만 바꾸면 되네
                    child: new IngredientsList(
                  makeChipList: MakeChipList,
                  ingredient: [
                    new Ingredient("새우", 1, false),
                    new Ingredient("식빵", 3, false),
                    new Ingredient("대파", 2, false),
                    new Ingredient("치즈", 5, false),
                    new Ingredient("우유", 5, false),
                    new Ingredient("돼지고기", 1, false),
                    new Ingredient("간장", 4, false),
                    new Ingredient("소금", 4, false),
                    new Ingredient("양파", 2, false),
                  ],
                ))*/
                ],
              ))
            ])),
          ]),
      bottomNavigationBar: BottomNavigator(),
    );
  }
}
