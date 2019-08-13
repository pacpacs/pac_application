import 'dart:async';
import '../fixed/communityListItem.dart';

class CommunityBloc extends Object{
  final _listItem = StreamController<CommunityListItem>();

  Stream<CommunityListItem> get listItem => _listItem.stream;

  Function(CommunityListItem) get setlistItem => _listItem.sink.add;

  CommunityBloc()
  {
    setlistItem(CommunityListItem());
  }

  dispose(){
    _listItem.close();
  }
}