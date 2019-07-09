import 'package:flutter/material.dart';

//import 'package:parallax_image/parallax_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pac_app/fixed/recipe/bestRecipe/bestRecipe.dart';

/**
 * P&C의 메인을 구성하는 homePage
 *
 * @author 서윤경
 * @version 1.0, P&C 의 homePage
 * @date 2019.07.02
 */

class homePage extends StatefulWidget {
  Function(int) stateChange;

  homePage(this.stateChange);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Pick & Cook', //TODO: Text 크기 유동성있게 만들기
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  fontStyle: FontStyle.italic)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
//            enabled: false,
            onTap: () =>
                {widget.stateChange(3)}, //TODO: Ingredient_popup창 뜨게 하기,
            controller: editingController,
            decoration: InputDecoration(
                labelText: "  Ingredient Search",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Today\'s Recommended Recipe',
              style: theme.textTheme.title,
            )),
        BestRecipe()
      ],
    );
  }
}
