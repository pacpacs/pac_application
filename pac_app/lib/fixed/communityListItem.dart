import 'customListItem.dart';

//TODO : Json파일 형식 맞춰서 받아올 부분
class CommunityListItem {

  List<CustomListItem> communityResult = [];
  List<CustomListItem> recommendResult = [];
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
    this.recommendResult =[
      CustomListItem('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY-g6Lf6DLGI-5VVvfpU_TqR_33e-6rmSoBg70g-YQ3UHKaMkC',
      '에그인헬', '계란이 지옥에 빠지다'),
      CustomListItem('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5EEElbsXRQ7gc1w1O2ObD47v7sRWdo9MN9yk8ySg7WoTOrOIw',
      '카레', '카레카레카레카레야~'),
      CustomListItem('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4kKfcYaq0LudtbSfLKrhsfADN3HJEBMCng-JYMoEWHT2oqjHP',
          '맥적구이', '산적이아니라 맥적이야~'),
      CustomListItem('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ90s0SpAqCgmfnX0yeVqe94oatvszP6yqxF4_pSKoMFz0VIja74A',
          '김치찌개', '김치찌개는 진리야'),
      CustomListItem('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3iCMLvcbnABDhJH8H16_eYiTu9mWnjeqZy8cuqJOL-_uImTgx',
          '떡볶이', '떡볶이 젤좋아'),
      CustomListItem('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcWOBvlDZF61xFTDxPuELD5DLvuNhX7MbA3J0JUS2ZWqNrSDSArw',
          '김밥', '엄마가해준 김밥'),
    ];
  }
}