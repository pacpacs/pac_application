import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pac_app/model/RecipeModel.dart';
import 'package:pac_app/fixed/card/ShowCardBloc.dart';

class ShowCardElement extends StatelessWidget{
  int _idx;
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
                        Container(
                          child: ListView(children: <Widget>[
                            SizedBox(
                              width: 120,
                              height: 180,
                              child: Image.network(
                                recipe[_idx].imgPath,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                recipe[_idx].description,
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
                              showCardBloc.dispatch(PageEvent.previous);
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
                              showCardBloc.dispatch(PageEvent.next);
                            },
                          ),
                        )),
                      ],
                    ))));
      },
    );
  }
}