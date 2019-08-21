import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pac_app/bloc/setWriteCardBloc.dart';
import 'package:pac_app/model/RecipeModel.dart';
import 'package:pac_app/fixed/card/ShowCardBloc.dart';
import 'package:pac_app/bloc/setWriteCardState.dart';

class WriteCardElement extends StatelessWidget {
  List<RecipeModel> recipe = new List<RecipeModel>();
  var _image;

  Future getimage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//stateful에서는 setState(_이미지=이미지) 였다.
    _image = image;
    print('이미지:'+_image.toString());
  }

  @override
  Widget build(BuildContext context) {
    final ShowCardBloc showCardBloc = BlocProvider.of<ShowCardBloc>(context);
    
    return BlocBuilder<ShowCardBloc, int>(
      builder: (context, _idx) {
        int _idxMax = 1;
        return Container(
            height: 300,
            child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Flex(
                        direction: Axis.vertical,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: FlatButton(
                              child: Image.asset('images/recipeStepImagePicker.jpg'),
                              onPressed: () => {
                                //TODO:버튼 이미지 변경하는 Bloc call
                                // setWriteCardBloc.dispatch(WriteCardEvent.imageApply)
                                getimage(),
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '요리 단계를 설명해주세요.',
                              ),
                              cursorColor: Colors.amber,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: Align(
                      alignment: Alignment(-1.1, 0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_left),
                        iconSize: 40,
                        onPressed: () => {
                          //현재 페이지 내용을 List에 저장
                          print('현제페이지:$_idx'),
                          if (_idx > 0)
                            {
                              showCardBloc.dispatch(PageEvent.previous),
                              //List<레시피>[_idx]의 이전단계 데이터를 출력
                            }
                        },
                      ),
                    )),
                    Container(
                        child: Align(
                      alignment: Alignment(1.1, 0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_right),
                        iconSize: 40,
                        onPressed: () => {
                          if (_idx < _idxMax - 1)
                            {
                              //List<레시피>[_idx]의 다음단계 데이터 출력
                              showCardBloc.dispatch(PageEvent.next)
                            }
                          else
                            {
                              _idxMax++,
                              recipe.add(RecipeModel()),
                              showCardBloc.dispatch(PageEvent.next),
                            }
                        },
                      ),
                    )),
                  ],
                )));
      },
    );
  }
}
