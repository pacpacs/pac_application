import 'dart:async';
import 'package:bloc/bloc.dart';

enum PageEvent{ previous, next }

class ShowCardBloc extends Bloc<PageEvent,int>{
  @override
  int get initialState=>0;

  @override
  Stream<int> mapEventToState(PageEvent event) async*{
    switch (event) {
      case PageEvent.previous:
        yield currentState -1;
        break;
      case PageEvent.next:
      yield currentState +1;
        break;
    }
  }
}

class CardA extends Bloc<ShowCardBloc,int>{
  @override
  // TODO: implement initialState
  int get initialState => null;

  @override
  Stream<int> mapEventToState(ShowCardBloc event) {
    // TODO: implement mapEventToState
    return null;
  }
  
}