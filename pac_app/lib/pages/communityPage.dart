import 'package:flutter/material.dart';
import 'package:pac_app/fixed/appBar.dart';
import '../bloc/community_bloc.dart';
import '../fixed/customListItem.dart';
import '../fixed/communityListItem.dart';
class communityPage extends StatefulWidget{
  _communityPageState createState() => new _communityPageState();
}

class _communityPageState extends State<communityPage>{

  //ScrollController _scrollController;

  @override
  void initState(){
    super.initState();
    //_scrollController = new ScrollController();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
      stream: CommunityBloc().listItem,
      builder: (context, AsyncSnapshot<CommunityListItem> snapshot){
        if(snapshot.hasData) {
          return communityList(snapshot);
        }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget communityList(AsyncSnapshot<CommunityListItem> snapshot){

    return ListView.builder(
      scrollDirection: Axis.vertical,
     // controller: _scrollController,
     // shrinkWrap: true,
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