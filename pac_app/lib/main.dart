import 'package:flutter/material.dart';

import 'fixed/appBar.dart';
import 'fixed/bottomNavigator.dart';
import 'pages/searchResultPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar.getAppBar(context, ''),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Search Result', style:TextStyle(fontSize: 20)),
                color:Colors.cyan,
                onPressed: (){
                  Navigator.push(context, 
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                      return searchResultPage();
                    }
                   )
                  );
                }
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigator()
        );
  }
}
