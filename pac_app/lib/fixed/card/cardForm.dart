import 'package:flutter/material.dart';

import 'CardElement.dart';

class CardForm extends StatelessWidget {
  final CardElement item;
  CardForm(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: new Stack(
      children: <Widget>[
        new Container(child: item),
        new Positioned(
            left: -10,
            top: 50,
            child: new IconButton(
              iconSize: 40,
              icon: Icon(Icons.arrow_left),
              onPressed: () {},
            )),
        new Positioned(
            right: -10,
            top: 50,
            child: new IconButton(
              iconSize: 40,
              icon: Icon(Icons.arrow_right),
              onPressed: () {},
            )),
      ],
    ));
  }
}
