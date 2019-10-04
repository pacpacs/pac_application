import 'package:flutter/material.dart';
import 'package:pac_app/fixed/profile/User.dart';
import '../bloc/Community/CommunityEvent.dart';
import '../fixed/appBar.dart';
import '../bloc/Community/CommunityBloc.dart';
import '../fixed/PostListItem.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../style/textStyle.dart';
import '../bloc/Community/CommunityState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipeShowPage.dart';

class communityPage extends StatefulWidget {
  User user;
  communityPage(this.user);
  _communityPageState createState() => new _communityPageState(user: user);
}

class _communityPageState extends State<communityPage> {
  User user;
  _communityPageState({this.user});
  CommunityBloc _communityBloc;
  @override
  void initState() {
    super.initState();
    _communityBloc = BlocProvider.of<CommunityBloc>(context);
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<CommunityBloc, CommunityState>(
        builder: (context, state) {
      _communityBloc.dispatch(Fetch());
      //print(state);
      if (state is CommunityUninitialized) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
        );
      }
      if (state is CommunityError) {
        return Center(
          child: Text("faild to fatch posts"),
        );
      }
      if (state is CommunityLoaded) {
        if (state.communities.isEmpty) {
          return Center(
            child: Text("No Posts"),
          );
        }
        return RecipeList(state.communities);
      }
    });
  }

  Widget RecipeList(List<PostListItem> communities) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 0,
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "오늘의 레시피",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black38,
                          offset: Offset(1, 2),
                          blurRadius: 3)
                    ]),
              )),
        ),
        Flexible(flex: 2, child: recommendList(communities)),
        Flexible(flex: 3, child: communityList(communities))
      ],
    );
  }

  Widget recommendList(List<PostListItem> communities) {
//TODO: Recommend List만 따로 빼네야함.
    return CarouselSlider(
      items: communities.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                //width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: ClipRRect(
                  //모서리둥글게
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item.itemPreview, fit: BoxFit.fill),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
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
                  ),
                ));
          },
        );
      }).toList(),
      autoPlay: true,
      enableInfiniteScroll: true,
      scrollDirection: Axis.horizontal,
      enlargeCenterPage: true,
      viewportFraction: 0.8,
    );
  }

  Widget communityList(List<PostListItem> communities) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      // controller: _scrollController,
      // shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(
        color: Colors.black12,
      ),
      itemCount: communities.length,
      itemBuilder: (BuildContext context, int index) {
        var item = communities[index];
        //TODO: expanding ListTile
        return ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return RecipeShowPage(user);
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
