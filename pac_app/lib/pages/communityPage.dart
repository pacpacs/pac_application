import 'package:flutter/material.dart';
import 'package:pac_app/fixed/appBar.dart';
import '../bloc/community_bloc.dart';
import '../fixed/customListItem.dart';
import '../fixed/communityListItem.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../style/textStyle.dart';
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
           flex: 0,
           child:Container(
             margin:EdgeInsets.symmetric(vertical: 10.0),
            child:
              Text("Today's Recipe",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color:Colors.black38,offset: Offset(1,2), blurRadius: 3)]
              ),)
           ),
         ),
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
            var item = f.itemTitle;
          return Container(
            //width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: ClipRRect( //모서리둥글게
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
              children: <Widget>[
                Image.network(f.itemPreview, fit: BoxFit.fill),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(100, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Text(
                      '$item',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),)
          );
        },);
    }).toList(),
      autoPlay: true,
      enableInfiniteScroll: true,
      scrollDirection: Axis.horizontal,
      enlargeCenterPage: true,
      viewportFraction: 0.8,
    );
  }

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