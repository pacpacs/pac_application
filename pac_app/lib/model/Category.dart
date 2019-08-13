import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum CategoryType{MEAT,VEGETABLE,GRAIN,SEASONING,ETC}

class Category{
  CategoryType type;
  String name;
  Color color;
  Category({@required this.type, @required this.name, @required this.color});
  //TODO: i18n support
  static Map<CategoryType,Category> categoryList={
    CategoryType.MEAT:Category(
      type: CategoryType.MEAT,
      name: "육류",
      color: Colors.red.shade800
    ),
    CategoryType.VEGETABLE:Category(
      type: CategoryType.VEGETABLE,
      name: "채소",
      color: Colors.green.shade900
    ),
    CategoryType.GRAIN:Category(
      type: CategoryType.GRAIN,
      name: "곡물",
      color:Colors.brown
    ),
    CategoryType.SEASONING:Category(
      type: CategoryType.SEASONING,
      name: "양념",
      color:Colors.deepOrangeAccent.shade100
    ),
    CategoryType.ETC:Category(
      type: CategoryType.ETC,
      name: "기타",
      color: Colors.black
    )
  };
}