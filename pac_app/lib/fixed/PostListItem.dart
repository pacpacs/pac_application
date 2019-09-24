import 'package:equatable/equatable.dart';

class PostListItem extends Equatable{
  final String itemPreview;
  final String itemTitle;
  final String itemDescription;

  PostListItem({this.itemPreview, this.itemTitle, this.itemDescription}):
        super([itemPreview,itemTitle,itemDescription]);
  Future getImageUrl() async{
    if(itemPreview != null) return;
  }
  @override
  String toString() => '$itemTitle';
}