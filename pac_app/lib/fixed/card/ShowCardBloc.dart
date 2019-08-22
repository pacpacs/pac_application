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