import 'package:flutter/material.dart';
import 'package:pac_app/fixed/card/CardElement.dart';

class ShowCardElement extends CardElement {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: <Widget>[
        new Image.network(
          'https://i.imgur.com/4AiXzf8.jpg',
          fit: BoxFit.contain,
          height: 120.0,
          width: 180.0,
        ),
        new Text(
          'This will be the place for recipe description.\nThis will be the place for recipe description.\nThis will be the place for recipe description.\nThis will be the place for recipe description\nThis will be the place for recipe description.\nThis will be the place for recipe description.',
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
