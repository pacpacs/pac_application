import 'package:flutter/material.dart';
import 'package:pac_app/fixed/card/cardForm.dart';

class recipeShowPage extends StatefulWidget {
  @override
  _recipeShowPageState createState() => _recipeShowPageState();
}

class _recipeShowPageState extends State<recipeShowPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(padding: const EdgeInsets.all(0.0),
                color: Colors.orange,
                width: 80.0,
                height: 80.0,),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(padding: const EdgeInsets.all(0.0),
                      color: Colors.blue,
                      width: 80.0,
                      height: 80.0,),
                    Container(padding: const EdgeInsets.all(0.0),
                      color: Colors.cyanAccent,
                      width: 80.0,
                      height: 80.0,)
                  ],
                ),
              )
            ],
          ),
        ),
        Container(child: cardForm(new Card()))
      ],
    );
  }
}
