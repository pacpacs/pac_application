import 'package:flutter/material.dart';

class ingredientChip {
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
                //TODO : 칩 삭제 하려면 여길 참고. https://api.flutter.dev/flutter/material/Chip/onDeleted.html
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