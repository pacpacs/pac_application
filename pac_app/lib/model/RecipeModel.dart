class RecipeModel {
  String id;
  int orderNum;
  String title;
  String imgPath;
  String description;
  int kcal;
  int like = 0;
  int views = 0;
  String author;
  DateTime createdDate;

  RecipeModel(
      {this.id,
      this.orderNum,
      this.title,
      this.imgPath,
      this.description,
      this.kcal,
      this.author,
      this.createdDate});
}

//TODO: DB에서 받아오게 하기
class RecipeModelList {
  List<RecipeModel> recipeModelList;

  RecipeModelList({this.recipeModelList});

  checkRecipeModelList(){
    this.recipeModelList.sort((a,b){
      return a.orderNum.compareTo(b.orderNum);
    });
  }
}

