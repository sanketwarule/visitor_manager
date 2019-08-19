import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:visitor_repository/visitor_repository.dart';

@immutable
abstract class HomeEvent extends Equatable{
  HomeEvent([List props = const []]) : super(props);
}

class CheckIn extends HomeEvent{

  final Visitor visitor;

  CheckIn(this.visitor) : super([visitor]);

  @override
  String toString() {
    // TODO: implement toString
    return "CheckIn { visitor : $visitor}";
  }
}

class CheckOut extends HomeEvent{

  final Visitor visitor;

  CheckOut(this.visitor) : super([visitor]);

  @override
  String toString() {
    // TODO: implement toString
    return "CheckOut { visitor : $visitor}";
  }
}