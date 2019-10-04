import 'dart:convert';

import 'package:pac_app/fixed/CustomListItem.dart';
import 'package:query_params/query_params.dart';
import 'package:http/http.dart' as http;

class RecipeFunction {
  List<CustomListItem> recipeModelList;

  List<CustomListItem> getRecipeModelList() {
    return recipeModelList;
  }

  Future<List<CustomListItem>> getRecipeModelListBySelectedChipList(
      List<String> selectedChipList) async {
    //TODO: 서버주소로 옮기기
    var parameters = makeParam(selectedChipList);
    var url = 'http://211.221.212.72:8080/recipes/getResult?' + parameters;
    await http.get(url).then((response) => {
          if (response.statusCode == 200)
            {
              recipeModelList = makeListToCustomItemList(response.body)
            }
          else
            {
              //error처리
            }
            
        });
        return recipeModelList;
  }
  
}

String makeParam(List<String> selectedChipList) {
  String str = "ingredients=";
  var count = 0;
  for (String chip in selectedChipList) {
    if (count == selectedChipList.length - 1) {
      str = str + chip;
    } else {
      str = str + "" + chip + ",";
    }
    count++;
  }
  return str;
}

List<CustomListItem> makeListToCustomItemList(String body) {
  List<dynamic> list = json.decode(body);
  List<CustomListItem> parsedJsonCustomListItmeList = new List();
  for (dynamic l in list) {
    CustomListItem cli = CustomListItem.fromJsonWithPercentage(l);
    if(cli.itemDescription==null){
      cli.itemDescription="";
    }
    if(cli.itemPreview==null){
      cli.itemPreview="";
    }
    if(cli.itemTitle==null){
      cli.itemTitle="";
    }
  
    parsedJsonCustomListItmeList.add(cli);
  }
  return parsedJsonCustomListItmeList;
}
