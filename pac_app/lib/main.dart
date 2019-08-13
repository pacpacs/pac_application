import 'package:flutter/material.dart';
import 'package:pac_app/pages/homePage.dart';

import 'AuthState.dart';
import 'fixed/appBar.dart';
import 'package:pac_app/bloc/BlocProvider.dart';

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
      Text(
        'CommunityPage',
      ),
      homePage(_changeView),
      Text(
        'My RecipePage',
      )
      //or you can add more widget
    ];

    final bloc = BlocProvider.of(context).authBloc;

    AppBar appbar;
    bloc.authentication.listen((auth) {
      switch (auth) {
        case AuthState.admin:
          appbar = appBar.getAppBarWithAuthAdmin(context);
          break;
        case AuthState.user:
          appbar = appBar.getAppBarWithAuthUser(context);
          break;
        case AuthState.noneUser:
          appbar = appBar.getAppBarWithNoneUser(context);
      }
    });
    return BlocProvider(
        child: Scaffold(
            appBar: appBar.getAppBar(context, false),
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
