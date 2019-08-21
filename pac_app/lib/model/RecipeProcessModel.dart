class RecipeProcessModel {
  /*
  _id:몽고DB에서 자동생성되는 튜플 식별자
  STRE_STEP_IMAGE_URL:조리방법 
  STEP_TIP: 조리 시 tip
  RN:??
  RECIPE_ID:무슨 레시피의 조리방법이냐
  COOKING_DC:조리방법 설명
  COOKING_NO:조리단계
  */
  var _id;
  String stre_step_image_url;
  String step_tip;
  int rn;
  int recipe_id;
  String cooking_dc;
  int cooking_no;

  RecipeProcessModel(
    this._id,
    this.stre_step_image_url,
    this.step_tip,
    this.rn,
    this.recipe_id,
    this.cooking_dc,
    this.cooking_no,
  );
}

class RecipeProcessModelList {
  List<RecipeProcessModel> process_step;

  RecipeProcessModelList(this.process_step);

  checkRecipeModelList(){
    this.process_step.sort((a,b){
      return a.cooking_no.compareTo(b.cooking_no);
    });
  }
}