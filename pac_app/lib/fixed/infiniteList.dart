import 'package:flutter/material.dart';

ListTile _makeTile(String name)=>ListTile(
    leading: CircleAvatar(backgroundColor: Colors.teal,),
    title: Text('$name'),
    subtitle: Text('subtitle'),
  );