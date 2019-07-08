import 'package:flutter/material.dart';

import 'package:pac_app/fixed/ingredientChips/ingredientChip.dart';

class recipeWritePage extends StatefulWidget {
  recipeWritePage({Key key, this.title}) : super(key : key);
  final String title;
  @override
  _recipeWritePageState createState() => _recipeWritePageState();
}

class _recipeWritePageState extends State<recipeWritePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('hello world'),
    );
  }
}