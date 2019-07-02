import 'package:flutter/material.dart';

class searchResultPage extends StatefulWidget {
  @override
  _searchResultPageState createState() => _searchResultPageState();
}

class _searchResultPageState extends State<searchResultPage> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text('Search Result'),
          centerTitle: true,
          ),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 30, left:30, top: 10, bottom: 10),
                child: TextField( //검색 창
                 style: TextStyle(
                   fontSize:12.0,
                   height: 0.5,
                   color: const Color(0xFF000000),
                   fontFamily: "Roboto"
                   ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                     borderRadius:const BorderRadius.all(
                     const Radius.circular(50.0)
                     )
                   ),
                   hintText: 'gone'
                   ),
                  onChanged: (String a){
                   print('changed to ' + a);
                  },
                ),
              ),
    
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: <Widget>[
                  //to-do:ship generator
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
              Divider(),
              //to-do:무한스크롤 커스텀아이템 리스트 +맨위로 가는 버튼
            ]
          )
      );
  }
  ListTile _makeTile()=>ListTile(
    leading: CircleAvatar(backgroundColor: Colors.teal,),
    title: Text('title'),
    subtitle: Text('subtitle'),
  ); 
}