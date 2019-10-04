import 'dart:async';
import 'dart:convert';
import '../../fixed/PostListItem.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'CommunityEvent.dart';
import 'CommunityState.dart';
import 'package:flutter/material.dart';

class CommunityBloc extends Bloc<CommunityEvent,CommunityState>{

  final http.Client httpClient;
  CommunityBloc({@required this.httpClient});

  /*@override
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
  }*/
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

    print("Fetch STARTED");
    final response = await httpClient.get("http://192.168.1.6:8080/recipes/");
    //final response = await httpClient.get("http://localhost:27071/recipe/list");
//TODO : 실제 서버 연결
    if(response.statusCode == 200){
      final data = json.decode(response.body) as List;
      return data.map((rawPost){
        return PostListItem(
          //TODO: 실제 서버 연결시 사용할 Item List
          itemPreview : rawPost['imgUrl'],
          itemTitle  : rawPost['recipeNmKo'],
          itemDescription:  rawPost['sumry'],
        );
      }).toList();
    }else{
      print("error");
      throw Exception('error fetching community posts');
    }

  }
}