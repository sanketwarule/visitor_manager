import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:visitor_manager/blocs/blocs.dart';
import 'package:visitor_repository/visitor_repository.dart';
import 'package:meta/meta.dart';

class VisitorsBloc extends Bloc<VisitorEvent, VisitorState>{

  final VisitorsRepository _visitorsRepository;
  StreamSubscription _visitorsSubscription;

  VisitorsBloc({@required VisitorsRepository visitorsRepository})
      : assert (visitorsRepository != null),
        _visitorsRepository = visitorsRepository;


  @override
  // TODO: implement initialState
  VisitorState get initialState => VisitorsLoading();

  @override
  Stream<VisitorState> mapEventToState(VisitorEvent event) async*{
    // TODO: implement mapEventToState

    switch(event.runtimeType){
      case LoadVisitors:
        yield* _mapLoadVisitorsToState();
        break;
      case AddVisitors:
        yield* _mapAddVisitorsToState(event);
        break;
      case VisitorsUpdated:
        yield* _mapVisitorsUpdatedToState(event);
        break;
      case DeleteVisitor:
        yield* _mapDeleteVisitorToState(event);
        break;
    }
  }

 Stream<VisitorState> _mapLoadVisitorsToState() async*{
   _visitorsSubscription?.cancel();
   _visitorsSubscription = _visitorsRepository.visitors().listen((visitors) {
        dispatch(
          VisitorsUpdated(visitors),
        );
      },
      );

  }

  Stream<VisitorState> _mapAddVisitorsToState(AddVisitors event) async*{
    _visitorsRepository.addNewVisitor(event.visitor);
  }

  Stream<VisitorState> _mapVisitorsUpdatedToState(VisitorsUpdated event) async*{
    yield VisitorsLoaded(event.visitors);
  }

 Stream<VisitorState> _mapDeleteVisitorToState(DeleteVisitor event){
    _visitorsRepository.deleteVisitor(event.visitor);
  }
}