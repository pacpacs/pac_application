import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pac_app/model/RecipeModel.dart';
import 'package:pac_app/fixed/card/ShowCardBloc.dart';

class ShowCardElement extends StatelessWidget {
  String imageUrl;
  String recipeDescription;
  List<RecipeModel> recipe;
  ShowCardElement({Key key, this.recipe});

  @override
  Widget build(BuildContext context) {
    final ShowCardBloc showCardBloc = BlocProvider.of<ShowCardBloc>(context);
    return BlocBuilder<ShowCardBloc, int>(
      builder: (context, _idx) {
        return Center(
            child: Container(
                child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: new Stack(
                      children: <Widget>[
                        Center(
                          child: Flex(
                            direction: Axis.vertical,
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                child: Image.network(
                                  recipe[_idx].imgPath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    recipe[_idx].description,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            child: Align(
                          alignment: Alignment(-1.1, 0),
                          child: IconButton(
                            iconSize: 40,
                            icon: Icon(Icons.arrow_left),
                            onPressed: () {
                              if (_idx > 0) {
                                showCardBloc.dispatch(PageEvent.previous);
                              }
                            },
                          ),
                        )),
                        Container(
                            child: Align(
                          alignment: Alignment(1.1, 0),
                          child: IconButton(
                            iconSize: 40,
                            icon: Icon(Icons.arrow_right),
                            onPressed: () {
                              if (_idx < recipe.length - 1) {
                                showCardBloc.dispatch(PageEvent.next);
                              }
                            },
                          ),
                        )),
                      ],
                    ))));
      },
    );
  }
}
