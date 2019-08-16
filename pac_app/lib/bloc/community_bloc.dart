import 'dart:async';
import '../fixed/communityListItem.dart';

class CommunityBloc extends Object{
  final _listItem = StreamController<CommunityListItem>();
  final _recommendList = StreamController<CommunityListItem>();

  Stream<CommunityListItem> get listItem => _listItem.stream;
  Stream<CommunityListItem> get recommendList=> _recommendList.stream;

  Function(CommunityListItem) get setlistItem => _listItem.sink.add;
  Function(CommunityListItem) get setRecommendList => _recommendList.sink.add;

  CommunityBloc()
  {
    setlistItem(CommunityListItem());
    setRecommendList(CommunityListItem());
  }

  dispose(){
    _listItem.close();
  }
}