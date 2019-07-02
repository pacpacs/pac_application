import 'package:flutter/material.dart';
import 'package:parallax_image/parallax_image.dart';

/**
 * P&C의 메인을 구성하는 homePage
 *
 * @author 서윤경
 * @version 1.0, P&C 의 homePage
 * @date 2019.07.02
 */

class homePage extends StatelessWidget {
  TextEditingController editingController = TextEditingController();

  /**
   * homePage의 body를 구성하는 Column
   *
   * @ param  BuildContext context : 현재 context
   * @ return Column
   */
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Pick & Cook', //TODO: Text 크기 유동성있게 만들기
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                  fontStyle: FontStyle.italic)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            enabled: false,
            onTap: () => {}, //TODO: Ingredient_popup창 뜨게 하기,
            controller: editingController,
            decoration: InputDecoration(
                labelText: "  Ingredient Search",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Today\'s Recommended Recipe',
              style: theme.textTheme.title,
            )),
        new Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          constraints: const BoxConstraints(maxHeight: 200.0),
          child: new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: _buildHorizontalChild,
          ),
        ),
      ],
    );
  }

  /**
   * 사진을 옆으로 넘겨 볼 수 있게 해줌
   *
   * @ param
   *          BuildContext context : 현재 context
   *          int index : 현재 사진 index
   * @ return ParallaxImage
   */

  Widget _buildHorizontalChild(BuildContext context, int index) {
    index++;
    if (index > 7) return null;
    return new Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: new ParallaxImage(
        extent: 100.0,
        image: new ExactAssetImage(
          'images/img$index.jpg', //TODO: 유동성 있는 사진 불러오게 하기
        ),
      ),
    );
  }
}
