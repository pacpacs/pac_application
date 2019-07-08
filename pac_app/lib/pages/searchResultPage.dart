import 'package:flutter/material.dart';

import 'package:pac_app/fixed/appbar.dart';
import 'package:pac_app/fixed/bottomNavigator.dart';
import 'package:pac_app/fixed/customListItem.dart';
import 'package:pac_app/fixed/ingredientChips/ingredientChip.dart';

class searchResultPage extends StatefulWidget {
  searchResultPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _searchResultPageState createState() => _searchResultPageState();
}

class _searchResultPageState extends State<searchResultPage> {

  //TODO : 검색결과 받아와서 resultRecipes 업데이트하기

  static customListItem temp = new customListItem(NetworkImage('https://i.imgur.com/zgoeSHx.jpg'),'SmallGoat','pretty cute');
  static customListItem temp1 = new customListItem(NetworkImage('https://i.imgur.com/03BMohH.jpg'),'Small Donkey','much wow');
  
  List<customListItem> resultRecipes=[temp1, temp];
  

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar.getAppBar(context, ''),
        body:
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 30, left:30, top: 15, bottom: 15),
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
    
              //wrap을 열고닫을 수 있게.. "더보기"버튼.
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: 
                  ingredientChip.generateChipList(),
              ),

              Divider(),

              //to-do:무한스크롤 커스텀아이템 리스트 +맨위로 가는 버튼
              Expanded(
                child: new ListView.builder(
                itemCount: resultRecipes.length,
                itemBuilder: (BuildContext cnxt, int index) {
                  final item = resultRecipes[index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: item.itemPreview
                      ),
                      title: Text(item.itemTitle),
                      subtitle: Text(item.itemDescription),
                  );
                },
              ),
              )
              
            ]
          ),
        bottomNavigationBar: BottomNavigator(),
      );
  }
   
}