import 'package:flutter/material.dart';

abstract class ListItem {}

class customListItem implements ListItem {
  final NetworkImage itemPreview;
  final String itemTitle;
  final String itemDescription;

  customListItem(this.itemPreview, this.itemTitle, this.itemDescription);
}