import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pac_app/AuthState.dart';
import 'package:pac_app/bloc/MultipleBlocProvider.dart';
import 'package:pac_app/bloc/RecipeFunction.dart';
import 'package:pac_app/fixed/IngredientInfo/IngredientChip.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pac_app/fixed/appBar.dart';
import 'package:pac_app/fixed/CustomListItem.dart';
import 'package:pac_app/fixed/profile/User.dart';
import 'package:pac_app/pages/recipeShowPage.dart';

class searchResultPage extends StatefulWidget {
  List<String> selectedChipName;
  searchResultPage(this.selectedChipName, {Key key, this.title})
      : super(key: key);
  final String title;

  @override
  _searchResultPageState createState() =>
      _searchResultPageState(selectedChipName);
}

class _searchResultPageState extends State<searchResultPage> {
  //TODO : 검색결과 받아와서 resultRecipes 업데이트하기
  List<String> selectedChipName;
  List<CustomListItem> searchResult = [];
  _searchResultPageState(this.selectedChipName);

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    print("init");
    RecipeFunction()
        .getRecipeModelListBySelectedChipList(selectedChipName)
        .then((data) {
      if (data != null) {
        searchResult = data;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    MultipleBlocProvider.of(context).ingredientBloc.setActive(null);

    final authBloc = MultipleBlocProvider.of(context).authBloc;
    final loginBloc = MultipleBlocProvider.of(context).loginValidatorBloc;
    User user;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: StreamBuilder(
            stream: authBloc.authentication,
            builder: (context, snapshot) {
              if (snapshot.data == AuthState.admin) {
                return appBar.getAppBarWithAuthAdmin(context, authBloc);
              } else if (snapshot.data == AuthState.user) {
                return appBar.getAppBarWithAuthUser(
                    context, authBloc, loginBloc.getCurrentUserData,loginBloc);
              } else {
                return appBar.getAppBarWithNoneUser(context);
              }
            },
          ) // StreamBuilder
          ),
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
                    hintText: 'search'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),

            //TODO:wrap을 열고닫을 수 있게.. "더보기"버튼.
            ChipListView(),
            Divider(),

            //to-do:무한스크롤 커스텀아이템 리스트 +맨위로 가는s FAB
            Expanded(
              child: new ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (BuildContext cnxt, int index) {
                  final item = searchResult[index];
    
                  if (searchResult.length == 0) {
                    return  ListTile(title:Text("검색 결과가 없습니다"));
                  } else {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.itemPreview),
                      ),
                      title: Text(item.itemTitle),
                      subtitle: AutoSizeText(item.itemDescription, maxLines: 2),
                      trailing: Text(item.percentage.toString() + "%"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return RecipeShowPage(user);
                        }));
                      },
                    );
                  }
                },
              ),
            )
          ]),
    );
  }
}
