import 'package:flutter/material.dart';
import 'package:pac_app/fixed/card/CardElement.dart';

class ShowCardElement extends CardElement {
  String imageUrl;
  String recipeDescription;
  ShowCardElement({Key key, @required this.imageUrl, @required this.recipeDescription});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: <Widget>[
        SizedBox(
          width: 120,
          height: 180,
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            recipeDescription,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
