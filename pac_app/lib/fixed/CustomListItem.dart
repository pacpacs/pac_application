abstract class ListItem {}

class CustomListItem implements ListItem {
  String itemPreview;
  String itemTitle;
  String itemDescription;
  int itemID;
  double percentage;
  

  CustomListItem({this.itemPreview, this.itemTitle, this.itemDescription,this.itemID});
  CustomListItem.withPercentage({this.itemPreview, this.itemTitle, this.itemDescription,this.itemID,this.percentage});
  
  factory CustomListItem.fromJsonWithPercentage(Map<String,dynamic> json) {
      return CustomListItem.withPercentage(
        itemDescription: json['sumry'],
        itemTitle:json['recipeNmKo'],
        itemPreview: json['imgUrl'],
        itemID:json['recipeId'],
        percentage:json['percenatge']
      );
  }
}