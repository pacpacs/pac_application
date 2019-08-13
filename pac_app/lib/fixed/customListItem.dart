abstract class ListItem {}

class CustomListItem implements ListItem {
  final String itemPreview;
  final String itemTitle;
  final String itemDescription;

  CustomListItem(this.itemPreview, this.itemTitle, this.itemDescription);
}