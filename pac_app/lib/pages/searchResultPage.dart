import 'package:flutter/material.dart';
import 'package:pac_app/bloc/BlocProvider.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pac_app/fixed/appBar.dart';
import 'package:pac_app/fixed/CustomListItem.dart';
import 'package:pac_app/fixed/ingredientInfo/ingredientChip.dart';

class searchResultPage extends StatefulWidget {
  searchResultPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _searchResultPageState createState() => _searchResultPageState();
}

class _searchResultPageState extends State<searchResultPage> {
  //TODO : 검색결과 받아와서 resultRecipes 업데이트하기

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
    //final AddListItemBloc _addItemBloc = BlocProvider.of(context);
    final bloc = BlocProvider.of(context).authBloc;
    List<CustomListItem> searchResult = [
      CustomListItem(
          'https://i.imgur.com/Z1LR83S.png', 'big quoka', 'very lovable'),
      CustomListItem('https://i.imgur.com/Kv9nlEP.jpg', 'Terrifying Koala',
          'big and aggressive')
    ];

    return Scaffold(
      appBar: appBar.getAppBar(context,bloc),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(
                  right: 30, left: 30, top: 15, bottom: 15),
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

            //TODO:wrap을 열고닫을 수 있게.. "더보기"버튼.
            Wrap(
              spacing: 4.0,
              runSpacing: 0.0,
              children: IngredientChip.generateChipList(),
            ),

            Divider(),

            //to-do:무한스크롤 커스텀아이템 리스트 +맨위로 가는 FAB
            Expanded(
              child: new ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (BuildContext cnxt, int index) {
                  final item = searchResult[index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.itemPreview),
                    ),
                    title: Text(item.itemTitle),
                    subtitle: Text(item.itemDescription),
                  );
                },
              ),
            )
          ]),
    );
  }
}
