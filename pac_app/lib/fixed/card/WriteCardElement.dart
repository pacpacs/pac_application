import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';

import 'package:pac_app/model/RecipeProcessModel.dart';
import 'package:pac_app/fixed/card/ShowCardBloc.dart';

class WriteCardElement extends StatefulWidget {
  @override
  _WriteCardElementState createState() => _WriteCardElementState();
}

class _WriteCardElementState extends State<WriteCardElement> {
  //TODO:_idxMax를 바깥쪽의 recipe에 set시켜주기
  List<WriteRecipeProcessModel> recipeStep =
      new List<WriteRecipeProcessModel>();

  var _image = Image.asset('images/recipeStepImagePicker.jpg');
  int _idxMax = 1;
  getOrderNum() {
    return _idxMax;
  }

  TextEditingController _txtController = new TextEditingController(text: '');

  Future getImageFromGallery(int index) async {
    //이미지 골라와서 리스트 두 개의 해당 idx에 저장,
    var image = await FilePicker.getFilePath(type: FileType.IMAGE);
    if (image != null) {
      setImageList(index, image.toString());
      setState(() {
        _image = Image.file(File(image));
        print(image);
      });
    }
  }

  setButtonImage(int idx) {
    //버튼위에 이미지 올리기
    setState(() {
      if (recipeStep[idx].stre_step_image_url != null) {
        _image = Image.file(File(recipeStep[idx].stre_step_image_url));
        print(recipeStep[idx].stre_step_image_url);
      } else {
        _image = Image.asset('images/recipeStepImagePicker.jpg');
      }
    });
  }

  setImageList(int index, String imagePath) {
    setState(() {

      //recipeStep에 이미지 path 저장
      print("디버그:레시피스텝.이미지url=" + imagePath);
      recipeStep[index].stre_step_image_url = imagePath;
    });
  }

  setRecipeSteps(int index) {
    //index번째 단계 출력
    setState(() {
      if (recipeStep[index].cooking_dc != null) {
        _txtController.text = recipeStep[index].cooking_dc;
      } else if (recipeStep[index].stre_step_image_url != null) {
        _image = Image.file(File(recipeStep[index].stre_step_image_url));
      } else {
        _txtController.clear();
        _image = Image.asset('images/recipeStepImagePicker.jpg');
      }
      print("SET RECIPE STEPS OF PAGE " + (index).toString());
    });
  }

  increaseIdxMax() {
    setState(() {
      _idxMax++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ShowCardBloc showCardBloc = BlocProvider.of<ShowCardBloc>(context);
    recipeStep
        .add(WriteRecipeProcessModel(null, null, null, null, null, null, null));
    return BlocBuilder<ShowCardBloc, int>(
      builder: (context, _idx) {
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
                                  recipeStep[_idx].cooking_dc = value;
                                  if (recipeStep[_idx].cooking_dc != null) {
                                    _txtController.text =
                                        recipeStep[_idx].cooking_dc;
                                  } else {
                                    _txtController.text = value;
                                  }
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
                              setRecipeSteps(_idx-1),
                              setButtonImage(_idx-1)
                            },
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
                          //List<레시피>[_idx]의 다음단계 데이터 출력
                          showCardBloc.dispatch(PageEvent.next),
                          if (_idx >= _idxMax - 1)
                            {
                              increaseIdxMax(),
                              recipeStep.add(WriteRecipeProcessModel(
                                  null, null, null, null, 1234, null, _idx)),
                          
                              print('레시피 스텝 갯수 : $_idxMax')
                            },
                          setButtonImage(_idx+1),
                          setRecipeSteps(_idx+1),
                        },
                      ),
                    )),
                  ],
                )));
      },
    );
  }
}
