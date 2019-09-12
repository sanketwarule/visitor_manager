import 'package:bloc/bloc.dart';
import 'package:visitor_manager/blocs/navigation/navigation_event.dart';
import 'package:visitor_manager/blocs/navigation/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent , NavigationState>{
  @override
  // TODO: implement initialState
  NavigationState get initialState => InitialState();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async*{
    // TODO: implement mapEventToState
    if(event is NavigateEvent){
      yield NavigateState();
    }else if (event is SnackBarEvent){
      yield SnackBarState();
    }
  }

}