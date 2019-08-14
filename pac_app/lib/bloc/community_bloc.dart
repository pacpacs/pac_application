import 'dart:async';
import '../fixed/communityListItem.dart';

class CommunityBloc extends Object{
  final _listItem = StreamController<CommunityListItem>();
  final _recommandList = StreamController<CommunityListItem>();

  Stream<CommunityListItem> get listItem => _listItem.stream;
  Stream<CommunityListItem> get recommandList=> _recommandList.stream;

  Function(CommunityListItem) get setlistItem => _listItem.sink.add;
  Function(CommunityListItem) get setRecommandList => _recommandList.sink.add;

  CommunityBloc()
  {
    setlistItem(CommunityListItem());
    setRecommandList(CommunityListItem());
  }

  dispose(){
    _listItem.close();
  }
}