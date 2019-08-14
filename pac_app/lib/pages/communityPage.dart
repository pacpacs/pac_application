import 'package:flutter/material.dart';
import 'package:pac_app/fixed/appBar.dart';
import '../bloc/community_bloc.dart';
import '../fixed/customListItem.dart';
import '../fixed/communityListItem.dart';
import 'package:carousel_slider/carousel_slider.dart';
class communityPage extends StatefulWidget{
  _communityPageState createState() => new _communityPageState();
}

class _communityPageState extends State<communityPage>{

  //ScrollController _scrollController
  PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = new PageController(initialPage: 1, viewportFraction: 0.8);
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
      stream: CommunityBloc().listItem,
      builder: (context, AsyncSnapshot<CommunityListItem> snapshot){
        if(snapshot.hasData) {
          return RecipeList(snapshot);
        }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget RecipeList(AsyncSnapshot<CommunityListItem> snapshot){
     return Column(
       children: <Widget>[
         Flexible(
             flex: 2,
             child: recommandList(snapshot)
         ),
         Flexible(
             flex: 3,
             child: communityList(snapshot)
         )
       ],
     );
  }

  Widget recommandList(AsyncSnapshot<CommunityListItem> snapshot) {
    return CarouselSlider(
      items: snapshot.data.recommandResult.map((f){
        return  Builder(
          builder: (BuildContext context){
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Image.network(f.itemPreview,
            fit: BoxFit.fill),
          );
        },);
    }).toList(),
      autoPlayInterval: Duration(seconds: 1),
      autoPlay: true,
      enableInfiniteScroll: true,
      scrollDirection: Axis.horizontal,
    );
  }
  /*
  Widget recommandList(AsyncSnapshot<CommunityListItem> snapshot){
    return PageView.builder(
        controller: _pageController,
        itemCount: snapshot.data.recommandResult.length,
        itemBuilder: (context, position){
          return AnimatedBuilder(
              animation: _pageController,
              builder: (context, widget){
                return Center(
                  child: Container(
                    child: Image.network(snapshot.data.recommandResult[position].itemPreview, fit:BoxFit.cover),
                  ),
                );
              });
        });
  }*/

  Widget communityList(AsyncSnapshot<CommunityListItem> snapshot){

    return ListView.separated(

      scrollDirection: Axis.vertical,
     // controller: _scrollController,
     // shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(
        color: Colors.black12,
      ),
      itemCount: snapshot.data.communityResult.length,
      itemBuilder: (BuildContext context, int index) {
        var item = snapshot.data.communityResult[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item.itemPreview),
          ),
          title: Text(item.itemTitle),
          subtitle: Text(item.itemDescription),
        );
      },
    );
  }

}