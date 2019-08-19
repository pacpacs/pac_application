import 'package:flutter/material.dart';
import 'package:pac_app/bloc/Community/community_event.dart';
import 'package:pac_app/fixed/appBar.dart';
import 'package:pac_app/bloc/Community/community_bloc.dart';
import '../fixed/postListItem.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../style/textStyle.dart';
import '../bloc/Community/community_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipeShowPage.dart';
class communityPage extends StatefulWidget{
  _communityPageState createState() => new _communityPageState();
}

class _communityPageState extends State<communityPage>{

  CommunityBloc _communityBloc;
  @override
  void initState(){
    super.initState();
    _communityBloc = BlocProvider.of<CommunityBloc>(context);
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<CommunityBloc, CommunityState>(
      builder:(context, state){
        _communityBloc.dispatch(Fetch());
        //print(state);
        if(state is CommunityUninitialized){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is CommunityError){
          return Center(
            child: Text("faild to fatch posts"),
          );
        }
        if(state is CommunityLoaded){
          if(state.communitys.isEmpty){
            return Center(
              child: Text("No Posts"),
            );
          }
          return RecipeList(state.communitys);
        }
      }
    );
  }

  Widget RecipeList(List<PostListItem> communitys){
     return Column(
       children: <Widget>[
         Flexible(
           flex: 0,
           child:Container(
             margin:EdgeInsets.symmetric(vertical: 10.0),
            child:
              Text("오늘의 레시피",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color:Colors.black38,offset: Offset(1,2), blurRadius: 3)]
              ),)
           ),
         ),
         Flexible(
             flex: 2,
             child: recommendList(communitys)
         ),
         Flexible(
             flex: 3,
             child: communityList(communitys)
         )
       ],
     );
  }


  Widget recommendList(List<PostListItem> communitys) {

    return CarouselSlider(
      items: communitys.map((f){
        return  Builder(
          builder: (BuildContext context){
            var item = f;
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
                      '$f',
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

  Widget communityList(List<PostListItem> communitys){

    return ListView.separated(

      scrollDirection: Axis.vertical,
     // controller: _scrollController,
     // shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(
        color: Colors.black12,
      ),
      itemCount: communitys.length,
      itemBuilder: (BuildContext context, int index) {
        var item = communitys[index];
        //TODO: expanding ListTile
        return ListTile(
          onTap: (){
            Navigator.push(context,
               MaterialPageRoute<void>(builder: (BuildContext context){
            return RecipeShowPage();
            }));
          },
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