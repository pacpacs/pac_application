import 'package:flutter/material.dart';
import 'package:pac_app/pages/communityPage.dart';
import 'package:pac_app/pages/homePage.dart';
import 'package:pac_app/pages/recipeShowPage.dart';
import 'AuthState.dart';
import 'fixed/appBar.dart';
import 'package:pac_app/bloc/BlocProvider.dart';

/**
 * P&C의 메인 총 구성
 *
 * @author 서윤경
 * @version 1.0, P&C 의 총 구성 main
 * @date 2019.08.16
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override 
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedViewIndex = 1;
  int _selectedNavigatorIndex = 1;

  _changeView(int index) {
    setState(() {
      _selectedViewIndex = index;
      _selectBottomNavigatorIndex(index);
    });
  }

  _selectBottomNavigatorIndex(int index) {
    setState(() {
      if (index > 2) {
        _selectedNavigatorIndex = 1;
      } else {
        _selectedNavigatorIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODO: 필요한 widget List 추가하기
    List<Widget> _widgetOptions = <Widget>[
      communityPage(),
      homePage(_changeView),

      RecipeShowPage(),
      Text('Select Ingredient Page')

      //or you can add more widget
    ];

    final authBloc = BlocProvider.of(context).authBloc;
    final loginBloc = BlocProvider.of(context).loginValidatorBloc;
    return BlocProvider(
        child: Scaffold(
            appBar: PreferredSize(
    preferredSize: const Size(double.infinity, kToolbarHeight),
    child: StreamBuilder(
      stream: authBloc.authentication,
      builder: (context,snapshot){
        if(snapshot.data==AuthState.admin){
          return appBar.getAppBarWithAuthAdmin(context, authBloc);
        }else if(snapshot.data==AuthState.user){
          return appBar.getAppBarWithAuthUser(context, authBloc,loginBloc.getCurrentUserData);
        }else {
          return appBar.getAppBarWithNoneUser(context);
        }
      },
    )// StreamBuilder
  ),
            body: Center(child: _widgetOptions[_selectedViewIndex]),
            bottomNavigationBar: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.people), title: Text('Community')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('Home')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.assignment), title: Text('My Recipe')),
                ],
                currentIndex: _selectedNavigatorIndex,
                selectedItemColor: Colors.amber[800],
                onTap: _changeView)));
  }
}
