import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pac_app/model/RecipeModel.dart';

//TODO: DB에서 받아오는 recipeModelList 어떻게 만들지 생각하기 
List<RecipeModel> dummyRecipeList = [
  new RecipeModel(
      id: "A",
      orderNum: 1,
      title: "title",
      imgPath:
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
      description: "description",
      kcal: 100,
      author: "SYK",
      createdDate: DateTime.now()),
  new RecipeModel(
      id: "A",
      orderNum: 2,
      title: "title2",
      imgPath:
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
      description: "description",
      kcal: 100,
      author: "SYK",
      createdDate: DateTime.now()),
  new RecipeModel(
      id: "A",
      orderNum: 3,
      title: "title3",
      imgPath:
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
      description: "description",
      kcal: 100,
      author: "SYK",
      createdDate: DateTime.now())
];
final List child = map<Widget>(
  dummyRecipeList,
  (index,recipe) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          //Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Image.network(recipe.imgPath, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                '${recipe.title}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class BestRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: child,
      enableInfiniteScroll: true,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
    );
  }
}
