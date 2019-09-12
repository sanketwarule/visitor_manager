import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visitor_manager/blocs/home/home.dart';
import 'package:visitor_manager/blocs/navigation/navigation.dart';
import 'package:visitor_manager/models/models.dart';
import 'package:visitor_manager/pages/register_screen.dart';
import 'package:visitor_repository/visitor_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{

  final VisitorsRepository _visitorsRepository;

  HomeBloc({@required VisitorsRepository visitorsRepository, NavigationBloc navigationBloc}): assert(visitorsRepository != null),
        _visitorsRepository = visitorsRepository;

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async*{
    // TODO: implement mapEventToState
    if(event is CheckIn) {
      yield* _mapCheckInToState(event);
    }else if (event is CheckOut){
        yield* _mapCheckOutToState();
    }
  }

  Stream<HomeState> _mapCheckInToState(CheckIn event) async*{
    print('inside is _mapCheckInToState');
    yield HomeInitial();
    bool isAlreadyRegistered = await _visitorsRepository.isAlreadyRegistered(event.visitor);
    if(isAlreadyRegistered){
      print('inside is if');
      // yield the visitors pass screen
//      _navigationBloc.dispatch(NavigateEvent());
    yield AlreadyRegisteredState();
    }else if(!isAlreadyRegistered){
      // yield the registration screen
      print('inside is else');
      yield NavigateToRegisterState();
//      _navigationBloc.dispatch(SnackBarEvent());

    }
  }

  Stream<HomeState> _mapCheckOutToState() async*{
  }
}