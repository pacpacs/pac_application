import 'package:flutter/material.dart';

class cardForm extends StatelessWidget {
  Widget item;

  cardForm(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Column(
              children: <Widget>[
                new Text('Hello World'),
                new Text('How are you?')
              ],
            )));
  }
}
