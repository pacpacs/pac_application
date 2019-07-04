import 'package:flutter/material.dart';
import './vegetable.dart' as vg;
import './seasoning.dart' as ss;
import './etc.dart' as etc;
import './fruit.dart' as fruit;
import './grain.dart' as gr;
import './meat.dart' as meat;
import './oil.dart' as oil;
import '../../fixed/appBar.dart';
import '../../fixed/bottomNavigator.dart';

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => new _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBar.getAppBar(context, ''),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(
                  right: 30, left: 30, top: 10, bottom: 10),
              child: TextField(
                //검색 창
                style: TextStyle(
                    fontSize: 12.0,
                    height: 0.5,
                    color: const Color(0xFF000000),
                    fontFamily: "Roboto"),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(50.0))),
                    hintText: 'gone'),
                onChanged: (String a) {
                  print('changed to ' + a);
                },
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.cyan.shade300,
                    child: Text('C'),
                  ),
                  label: Text('CyanLabel'),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue.shade300,
                    child: Text('B'),
                  ),
                  label: Text('BlueLabel'),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.red.shade300,
                    child: Text('R'),
                  ),
                  label: Text('RedLabel'),
                ),
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.yellow.shade300,
                    child: Text('Y'),
                  ),
                  label: Text('YellowLabel'),
                ),
              ],
            ),
            new Container(
                decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ))
          ]),
      bottomNavigationBar: BottomNavigator(),
    );
  }

  ListTile _makeTile() => ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal,
        ),
        title: Text('title'),
        subtitle: Text('subtitle'),
      );
}
