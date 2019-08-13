import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WriteCardElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: Card(
            elevation: 10.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: ListView(
                    children: <Widget>[
                      FlatButton(//TODO:버튼 크기 관리
                        child: Image.asset('images/img1.jpg'),
                        onPressed: ()=>{},
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '요리 단계를 설명해주세요.'),
                        cursorColor: Colors.amber,
                      )
                    ],
                  ),
                ),
                Container(
                    child: Align(
                  alignment: Alignment(-1.1, 0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_left),
                    iconSize: 40,
                    onPressed: () => {},
                  ),
                )),
                Container(
                    child: Align(
                  alignment: Alignment(1.1, 0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_right),
                    iconSize: 40,
                    onPressed: () => {},
                  ),
                )),
              ],
            )));
  }
}
