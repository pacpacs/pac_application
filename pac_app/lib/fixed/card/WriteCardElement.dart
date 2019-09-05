import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pac_app/model/RecipeModel.dart';
import 'package:pac_app/model/RecipeProcessModel.dart';
import 'package:pac_app/fixed/card/ShowCardBloc.dart';

class WriteCardElement extends StatefulWidget {
  @override
  _WriteCardElementState createState() => _WriteCardElementState();
}

class _WriteCardElementState extends State<WriteCardElement> {

  RecipeModel recipe = new RecipeModel();
  List<WriteRecipeProcessModel> recipeStep =
      new List<WriteRecipeProcessModel>();
  List<File> recipeStepImage = new List<File>();
  var _image = Image.asset('images/recipeStepImagePicker.jpg');

  TextEditingController _txtController = new TextEditingController(text: '');

  Future getImageFromGallery(int index) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setImageList(index, image.toString());
      setState(() {
        _image = Image.file(image);
        print(image.toString());
      });
    }
  }

  setImageList(int index, String imagePath) {
    //recipeStepImage Setting
    if (index >= recipeStepImage.length) {
      recipeStepImage.add(File(imagePath));
    } else {
      recipeStepImage[index] = File(imagePath);
    }
    //recipeStep Setting
    if (index >= recipeStep.length) {
      recipeStep.add(new WriteRecipeProcessModel(
          null, imagePath, null, null, null, null, null));
    } else {
      recipeStep[index].stre_step_image_url = imagePath;
    }
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
                              child: _image,
                              onPressed: () => {
                                getImageFromGallery(_idx),
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: TextField(
                              controller: _txtController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '요리 단계를 설명해주세요.',
                              ),
                              cursorColor: Colors.amber,
                              onSubmitted: (value) {
                                setState(() {
                                  if(recipeStep[_idx].cooking_dc != null){
                                    _txtController.text=recipeStep[_idx].cooking_dc;
                                  }
                                recipeStep[_idx].cooking_dc = value;
                                _txtController.text = value;
                                });
                              },
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
                          print('현재 페이지:$_idx'),
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
                          //TOOD:_idxMax 갱신-아니면 다른 방법으로 recipeStep추가
                          if (_idx >= _idxMax - 1)
                            {
                              _idxMax++,
                              recipeStep.add(WriteRecipeProcessModel(
                                  null, null, null, null, 1234, null, _idx)),
                              showCardBloc.dispatch(PageEvent.next),
                              print('레시피 스텝 갯수 : $_idxMax')
                            },
                          //List<레시피>[_idx]의 다음단계 데이터 출력
                          showCardBloc.dispatch(PageEvent.next),
                        },
                      ),
                    )),
                  ],
                )));
      },
    );
  }
}
