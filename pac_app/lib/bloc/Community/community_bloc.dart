import 'dart:async';
import 'dart:convert';
import '../../fixed/postListItem.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'community_event.dart';
import 'community_state.dart';
import 'package:flutter/material.dart';

class CommunityBloc extends Bloc<CommunityEvent,CommunityState>{

  final http.Client httpClient;
  CommunityBloc({@required this.httpClient});

  @override
  Stream<CommunityState> transform(
      Stream<CommunityEvent> events,
      Stream<CommunityState> Function(CommunityEvent event) next,
      ) {
    return super.transform(
      (events as Observable<CommunityEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }
  @override
  get initialState => CommunityUninitialized();
  @override

  bool _chkState(CommunityState state)=> state is CommunityLoaded;

  Stream<CommunityState> mapEventToState(event) async*{
    // TODO: implement mapEventToState

    if(event is Fetch && !_chkState(currentState)){
     try{
       //print(currentState);
       if(currentState is CommunityUninitialized) {
         final communities = await _fetchCommunitys();
         yield CommunityLoaded(communities: communities);
       }
       if(currentState is CommunityLoaded) {
         final communities = await _fetchCommunitys();
         yield communities.isEmpty
             ? (currentState as CommunityLoaded).copyWith()
             : CommunityLoaded(
              communities: (currentState as CommunityLoaded).communities + communities);
       }
     }catch(_){
       yield CommunityError();
     }
    }
  }
//TODO: 20개 씩만 받아오도록
  Future<List<PostListItem>>_fetchCommunitys() async{

    final response = await httpClient.get("https://jsonplaceholder.typicode.com/photos");

    if(response.statusCode == 200){
      final data = json.decode(response.body) as List;
      return data.map((rawPost){
        return PostListItem(
          itemPreview : rawPost['url'],
          itemTitle  : rawPost['id'].toString(),
          itemDescription:  rawPost['title'],
        );
      }).toList();
    }else{
      print("error");
      throw Exception('error fetching community posts');
    }

  }
}