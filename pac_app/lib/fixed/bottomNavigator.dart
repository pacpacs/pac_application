import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon:Icon(Icons.fastfood), title: Text('Recipe')),
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')), BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('Community')),
            ]);
  }
}
