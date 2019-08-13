import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:pac_app/fixed/customListItem.dart';

//여길 참고하는 중
// https://felangel.github.io/bloc/#/fluttercountertutorial

//Event
abstract class SearchResultListUpdateEvent {}

class Fetch extends SearchResultListUpdateEvent {
  @override
  String toString() => 'fetch';
}

//State
abstract class SearchResultListUpdateState {}

class InitializeFail extends SearchResultListUpdateState {
  @override
  String toString() => 'initialize fail';
}

class GetItemError extends SearchResultListUpdateState {
  @override
  String toString() => 'get item Error';
}

class GetItemSuccess extends SearchResultListUpdateState {
  final List<CustomListItem> itemLists;
  final bool hasReachedMax;

  GetItemSuccess(this.itemLists, this.hasReachedMax);

  GetItemSuccess copyWith({
    List<CustomListItem> itemLists,
    bool hasReachedMax,
  }) {
    return GetItemSuccess(itemLists, hasReachedMax);
  }

  @override
  String toString() => 'item successfully loaded';
}

//Bloc
class AddListItemBloc
    extends Bloc<SearchResultListUpdateEvent, SearchResultListUpdateState> {
  final int loadedItemQuantity;
  AddListItemBloc({@required this.loadedItemQuantity});

  @override
  SearchResultListUpdateState get initialState => InitializeFail();

  @override
  Stream<SearchResultListUpdateState> mapEventToState(
      SearchResultListUpdateEvent event) {
    if (event is Fetch && _hasReachedMax(currentState)) {
      try {
        if (currentState is InitializeFail) {
          print('Stream mapEventState - Initialize Failed');
        }
        if (event is GetItemSuccess) {
          final items =  CustomListItem('https://i.imgur.com/Kv9nlEP.jpg', 'Scary Koala',
            'but also lovely');
        }
      } catch (e) {
        print('error occurred...');
      }
    }
    return null;
  }
}

bool _hasReachedMax(SearchResultListUpdateState state) =>
    state is GetItemSuccess && state.hasReachedMax;
