import 'package:pac_app/model/Category.dart';
import 'package:meta/meta.dart';

class Ingredient {
  String name;
  Category category;
  bool isChecked;
  Ingredient(
      {@required this.name,
      @required this.category,
      this.isChecked = false});
}
