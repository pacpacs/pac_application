import 'customListItem.dart';

//TODO : Json파일 형식 맞춰서 받아올 부분
class CommunityListItem {

  List<CustomListItem> communityResult = [];
  CommunityListItem(){
    this.communityResult = [
      CustomListItem(
          'https://i.imgur.com/Z1LR83S.png', 'big quoka', 'very lovable'),
      CustomListItem('https://i.imgur.com/Kv9nlEP.jpg', 'Terrifying Koala',
          'big and aggressive'),
    ];
    for(int i=0; i<20; i++) {
      communityResult+=[CustomListItem('https://i.imgur.com/Z1LR83S.png',i.toString(), 'Not')];
    }
  }
}