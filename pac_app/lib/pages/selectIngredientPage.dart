import 'package:flutter/material.dart';
import 'package:pac_app/bloc/BlocProvider.dart';
import '../AuthState.dart';
import '../fixed/appBar.dart';
import '../fixed/ingredientInfo/ingredientsList.dart';
import '../fixed/ingredientInfo/ingredient.dart';
import '../fixed/ingredientInfo/ingredientChip.dart';
import '../fixed/ingredientInfo/ingredientSet.dart';

class selectIngredientPage extends StatefulWidget {
  @override
  _selectIngredientPageState createState() => new _selectIngredientPageState();
}

class _selectIngredientPageState extends State<selectIngredientPage> {
  List<Ingredient> _ingredient;

  MakeChipList(List<Ingredient> ingredient) {
    setState(() {
      _ingredient = ingredient;
      //_chips= ingredients.getIngredientChip(_productList)
    });
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BLOCProvider.of(context).authBloc;
    final loginBloc = BLOCProvider.of(context).loginValidatorBloc;
    return BLOCProvider(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: StreamBuilder(
            stream: authBloc.authentication,
            builder: (context, snapshot) {
              if (snapshot.data == AuthState.admin) {
                return appBar.getAppBarWithAuthAdmin(context, authBloc);
              } else if (snapshot.data == AuthState.user) {
                return appBar.getAppBarWithAuthUser(
                    context, authBloc, loginBloc.getCurrentUserData);
              } else {
                return appBar.getAppBarWithNoneUser(context);
              }
            },
          ) // StreamBuilder
          ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 4.0,
              runSpacing: 0.0,
              children: IngredientChip.generateChipList(),
            ),
            Container(
              child: IngredientsList(
                ingredient: [
                  new Ingredient("새우", CategoryCode.MEAT, false),
                  new Ingredient("식빵", CategoryCode.GRAIN, false),
                  new Ingredient("국수", CategoryCode.GRAIN, false),
                  new Ingredient("대파", CategoryCode.VEGITABLE, false),
                  new Ingredient("치즈", CategoryCode.ETC, false),
                  new Ingredient("우유", CategoryCode.ETC, false),
                  new Ingredient("돼지고기", CategoryCode.MEAT, false),
                  new Ingredient("간장", CategoryCode.SEASONING, false),
                  new Ingredient("소금", CategoryCode.SEASONING, false),
                  new Ingredient("양파", CategoryCode.VEGITABLE, false),
                ],
              ),
            ),
          ]),
    ));
  }
}
