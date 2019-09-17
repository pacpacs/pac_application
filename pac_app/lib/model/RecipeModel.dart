/*
DB data form
_id:몽고db ObjectId-자동생성
DET_URL:string okdab(농림수산식품교육문화정보원)에 등록된 레시피 게시글 주소
IRDNT_CODE:string 재료 코드
 */

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
  setID(String _id) {
    this.id = _id;
  }

  setOrderNum(int _orderNum) {
    this.orderNum = _orderNum;
  }

  setTitle(String _title) {
    this.title = _title;
  }

  setImgPath(String _imgPath) {
    this.imgPath = _imgPath;
  }

  setDescription(String _description) {
    this.description = _description;
  }

  setCalorie(int _kcal) {
    this.kcal = _kcal;
  }

  setLike(int _like) {
    this.like = _like;
  }

  setViews(int _views) {
    this.views = _views;
  }

  setAuthor(String _author) {
    this.author = _author;
  }

  setCreatedDate(DateTime _createdDate) {
    this.createdDate = _createdDate;
  }

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

//TODO:이 메소드는 필요가 없다! 데이터 포맷 맞출 때 삭제하기
  checkRecipeModelList() {
    this.recipeModelList.sort((a, b) {
      return a.orderNum.compareTo(b.orderNum);
    });
  }
}
