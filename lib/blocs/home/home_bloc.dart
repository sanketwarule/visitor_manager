import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:visitor_manager/blocs/home/home.dart';
import 'package:visitor_manager/models/models.dart';
import 'package:visitor_repository/visitor_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{

  final VisitorsRepository _visitorsRepository;

  HomeBloc({@required VisitorsRepository visitorsRepository}): assert(visitorsRepository != null),
        _visitorsRepository = visitorsRepository;  @override
  // TODO: implement initialState

  HomeState get initialState => HomeLoaded();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async*{
    // TODO: implement mapEventToState
    switch(event.runtimeType){
      case CheckIn:
        yield* _mapCheckInToState(event);
        break;
      case CheckOut:
        yield* _mapCheckOutToState();
        break;
    }
  }

  Stream<HomeState> _mapCheckInToState(CheckIn event) async*{
    _visitorsRepository.visitors().forEach((List<Visitor> vistor) {
    });

  }

  Stream<HomeState> _mapCheckOutToState() async*{
  }
}