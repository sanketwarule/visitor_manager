import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:visitor_repository/visitor_repository.dart';

@immutable
abstract class HomeState extends Equatable{
  HomeState([List props = const []]) : super(props);
}

class HomeLoading extends HomeState{

  @override
  String toString() {
    // TODO: implement toString
    return "HomeLoading";
  }

}

class HomeLoaded extends HomeState{

  @override
  String toString() {
    // TODO: implement toString
    return "HomeLoaded";
  }
}