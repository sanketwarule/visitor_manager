import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:visitor_repository/visitor_repository.dart';

@immutable
abstract class VisitorState extends Equatable{
  VisitorState([List props = const []]) : super(props);
}

class VisitorsLoading extends VisitorState{

  @override
  String toString() {
    // TODO: implement toString
    return "VisitorsLoading";
  }
}

class VisitorsLoaded extends VisitorState{

  final List<Visitor> visitors;

  VisitorsLoaded([this.visitors = const []]) : super([visitors]);

  @override
  String toString() {
    // TODO: implement toString
    return "VisitorsLoaded";
  }
}

class VisitorsNotLoaded extends VisitorState{

  @override
  String toString() {
    // TODO: implement toString
    return "VisitorsNotLoaded";
  }
}

