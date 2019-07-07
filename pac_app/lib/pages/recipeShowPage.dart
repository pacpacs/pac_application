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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.brown.shade800,
                      radius: 50,
                      child: Text('AH'),
                    )),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(" Recipe Title ",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                fontStyle: FontStyle.italic)),
                      ),
                      Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: new BoxDecoration(
                                      border:
                                          new Border.all(color: Colors.black)),
                                  width: 100,
                                  child: Center(
                                    child: Text(" Info1",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: new BoxDecoration(
                                      border:
                                          new Border.all(color: Colors.black)),
                                  width: 100,
                                  child: Center(
                                    child: Text(" Info2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic)),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(color: Colors.black87),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.black)),
              width: 300,
              height: 200,
              child: cardForm(new Card())),
        )
      ],
    );
  }
}
