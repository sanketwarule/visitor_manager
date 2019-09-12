import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:visitor_repository/visitor_repository.dart';

@immutable
abstract class HomeState extends Equatable{
  HomeState([List props = const []]) : super(props);
}


class HomeInitial extends HomeState{

  @override
  String toString() {
    // TODO: implement toString
    return "HomeInitial";
  }

}

class AlreadyRegisteredState extends HomeState{

  @override
  String toString() {
    // TODO: implement toString
    return "AlreadyRegisteredState";
  }
}

class NavigateToRegisterState extends HomeState{

  @override
  String toString() {
    // TODO: implement toString
    return "NavigateToRegisterState";
  }
}