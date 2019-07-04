import 'package:flutter/material.dart';

//import 'package:parallax_image/parallax_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

/**
 * P&C의 메인을 구성하는 homePage
 *
 * @author 서윤경
 * @version 1.0, P&C 의 homePage
 * @date 2019.07.02
 */

final List<String> imgList = [ //TODO: 서버사진리스트로 만들기 
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          //Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class homePage extends StatefulWidget {
  Function(int) stateChange;

  homePage(this.stateChange);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController editingController = TextEditingController();



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
                  fontSize: 30,
                  fontStyle: FontStyle.italic)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
//            enabled: false,
            onTap: () => {widget.stateChange(3)}, //TODO: Ingredient_popup창 뜨게 하기,
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
        CarouselSlider(
          items: child,
          enableInfiniteScroll: true,
          autoPlay: true  ,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0,

        )
      ],
    );
  }
}

