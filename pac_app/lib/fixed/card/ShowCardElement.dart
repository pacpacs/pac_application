import 'package:flutter/material.dart';
import 'package:pac_app/model/RecipeModel.dart';
import 'package:provider/provider.dart';

class ShowCardElement extends StatelessWidget with ChangeNotifier {
  int _idx = 0;
  String imageUrl;
  String recipeDescription;
  List<RecipeModel> recipe;
  ShowCardElement({Key key, this.recipe});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => RecipeViewer(
        imgPath: imageUrl,
        desc: recipeDescription,
      ),
      child: Center(
          child: Container(
              child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: new Stack(
                    children: <Widget>[
                      RecipeViewer(
                          imgPath: recipe[0].imgPath,
                          desc: recipe[0].description),
                      CardButton(
                        recipe: recipe,
                      ),
                    ],
                  )))),
    );
  }
}

class RecipeViewer extends StatelessWidget with ChangeNotifier {
  String imgPath, desc;
  RecipeViewer({this.imgPath, this.desc});

  get getImgpath => imgPath;
  set setImgpath(String newPath) {
    imgPath = newPath;
    notifyListeners();
  }

  get getDescription => desc;
  set setDescription(String newDesc) {
    desc = newDesc;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
        SizedBox(
          width: 120,
          height: 180,
          child: Image.network(
            imgPath,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            desc,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}

class CardButton extends StatefulWidget {
  final List<RecipeModel> recipe;
  CardButton({@required this.recipe});
  @override
  _CardButtonState createState() => _CardButtonState(recipe: recipe);
}

class _CardButtonState extends State<CardButton> {
  int _idx = 0;
  List<RecipeModel> recipe;
  _CardButtonState({this.recipe});

  @override
  Widget build(BuildContext context) {
    final viewerChanger = Provider.of<RecipeViewer>(context);

    return Stack(
      children: <Widget>[
        new Container(
            child: Align(
          alignment: Alignment(-1.1, 0),
          child: IconButton(
            iconSize: 40,
            icon: Icon(Icons.arrow_left),
            onPressed: () {
              setState(() {
                if (_idx > 0) {
                  _idx--;
                  viewerChanger.setImgpath = recipe[_idx].imgPath;
                  viewerChanger.setDescription = recipe[_idx].description;
                }
                String temp = viewerChanger.getImgpath;
                print('recipe[$_idx].imgpth : $temp');
              });
            },
          ),
        )),
        new Container(
            child: Align(
          alignment: Alignment(1.1, 0),
          child: IconButton(
            iconSize: 40,
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              setState(() {
                if (_idx < recipe.length) {
                  _idx++;
                  viewerChanger.setImgpath = recipe[_idx].imgPath;
                  viewerChanger.setDescription = recipe[_idx].description;
                }
                print('++index : $_idx');
              });
            },
          ),
        )),
      ],
    );
  }
}
