import 'package:bloc/bloc.dart';
import 'package:visitor_manager/blocs/home/home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{

  @override
  // TODO: implement initialState
  HomeState get initialState => HomeLoaded();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async*{
    // TODO: implement mapEventToState
    switch(event.runtimeType){
      case CheckIn:
        yield* _mapCheckInToState();
        break;
      case CheckOut:
        yield* _mapCheckOutToState();
        break;
    }
  }

  Stream<HomeState> _mapCheckInToState() async*{
    final state = currentState;
  }

  Stream<HomeState> _mapCheckOutToState() async*{
    yield HomeLoaded();
  }
}