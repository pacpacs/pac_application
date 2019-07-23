import 'package:flutter/material.dart';

import 'CardElement.dart';

class CardForm extends StatelessWidget {
  final CardElement item;
  CardForm(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: new Stack(
          children: <Widget>[
            new Container(child: item),
            new Container(
                child: Align(
              alignment: Alignment(-1.1, 0),
              child: IconButton(
                iconSize: 40,
                icon: Icon(Icons.arrow_left),
                onPressed: () {
                  print('arrow_left');
                  //TODO:이전 카드 보여주기. 이전 카드가 존재하지 않으면 disabled
                },
              ),
            )),
            new Container(
                child: Align(
              alignment: Alignment(1.1, 0),
              child: IconButton(
                iconSize: 40,
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  //TODO:다음 카드 보여주기. 다음 카드가 존재하지 않으면 disabled
                  //
                },
              ),
            )),
          ],
        ));
  }
}
