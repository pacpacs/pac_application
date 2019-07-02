import 'package:flutter/material.dart';
import 'package:pac_app/pages/homePage.dart';

import 'fixed/appBar.dart';
import 'fixed/bottomNavigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          //TODO: route사용이 안된다 되는 방법을 확인해보자
          '/': (context) => MyHomePage(),
//          '/login': (context) => Login(),
//          '/register': (context) => Register(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar.getAppBar(context, ''),
        body: Center(
          child: homePage()
        ),
        bottomNavigationBar: BottomNavigator());
  }
}
