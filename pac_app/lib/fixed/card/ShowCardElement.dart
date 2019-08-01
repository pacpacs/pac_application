import 'package:flutter/material.dart';
import 'package:pac_app/model/RecipeModel.dart';
import 'package:provider/provider.dart';

class ShowCardElement extends StatelessWidget with ChangeNotifier {
  String imageUrl;
  String recipeDescription;
  List<RecipeModel> recipe;
  ShowCardElement(
      {Key key,
      @required this.recipe});

//TODO : ChangeNoti implement

int _idx=0;
  get idx => _idx;
  set idx(int newIdx) {
    _idx = newIdx;
    imageUrl = recipe[_idx].imgPath;
    recipeDescription = recipe[_idx].description;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    final changer = Provider.of<ShowCardElement>(context);
    return Center(
        child: Container(
            child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      child: ListView(children: <Widget>[
                        SizedBox(
                          width: 120,
                          height: 180,
                          child: Image.network(
                            recipe[0].imgPath,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            recipe[0].description,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                    ),
                    new Container(
                        child: Align(
                      alignment: Alignment(-1.1, 0),
                      child: IconButton(
                        iconSize: 40,
                        icon: Icon(Icons.arrow_left),
                        onPressed: () {
                          
                          if (_idx > 0) {
                              _idx--;
                              _idx=changer.idx;
                              print('--index : $_idx');
                            }
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
                          if (_idx < recipe.length)
                              
                              _idx=changer.idx;
                              _idx++;
                            print('++index : $_idx');
                        },
                      ),
                    )),
                  ],
                ))));
  }
}
