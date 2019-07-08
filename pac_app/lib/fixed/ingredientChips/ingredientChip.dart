import 'package:flutter/material.dart';
import 'dummy_ingr.dart';

//TODO:리스트 아니고 맵이어야함

List<dummy_ingr> AAA = [];
List<Chip> BBB=[];

class ingredientChip {
  
  static void makeDummyList(){
    for(int i = 0; i < 20; i++){
     // AAA.add(dummy_ingr('A',1));
    }
  }

  static generateChipList() {
    makeDummyList();
    
    List<Widget> chipList = <Widget>[];

    for(dummy_ingr ingr in AAA){
      chipList.add(generateIngredientChip(ingr.ingCategory, ingr.ingName));
    }
    return chipList;
  }
  
  static generateIngredientChip(int categoryCode, String name) {
    switch (categoryCode) {
          case 1://육류
            return new Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.red.shade800,
              ),
              label: Text(name),
              onDeleted: () {
                print(name);
                //TODO : 칩 삭제 구현하려면 여길 참고. https://api.flutter.dev/flutter/material/Chip/onDeleted.html
              },
            );
            break;
          case 2://채소
            return new Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.green.shade900,
              ),
              label: Text(name),
              onDeleted: () {
                print(name);
              },
            );
            break;
          case 3://밥,빵,면
            return new Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.brown,
              ),
              label: Text(name),
              onDeleted: () {
                print(name);
              },
            );
            break;
          case 4://향신료
            return new Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.deepOrangeAccent.shade100,
              ),
              label: Text(name),
              onDeleted: () {
                print(name);
              },
            );
            break;
          default: return new Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
              ),
              label: Text(name),
            );
            break;
        }
  }    
}