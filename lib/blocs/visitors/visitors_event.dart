import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:visitor_repository/visitor_repository.dart';

@immutable
abstract class VisitorEvent extends Equatable{
  VisitorEvent([List props = const []]) : super(props);
}

class LoadVisitors extends VisitorEvent{

  @override
  String toString() {
    // TODO: implement toString
    return "LoadVisitors";
  }
}

class AddVisitors extends VisitorEvent{
  final Visitor visitor;

  AddVisitors(this.visitor) : super([visitor]);

  @override
  String toString() {
    // TODO: implement toString
    return "AddVisitors { visitor : $visitor }";
  }
}

class DeleteVisitor extends VisitorEvent{
  final Visitor visitor;

  DeleteVisitor(this.visitor) : super([visitor]);

  @override
  String toString() {
    // TODO: implement toString
    return "DeleteVisitor { visitor : $visitor }";
  }
}

class VisitorsUpdated extends VisitorEvent{
  final List<Visitor> visitors;

  VisitorsUpdated(this.visitors) : super([visitors]);

  @override
  String toString() {
    // TODO: implement toString
    return "VisitorsUpdated";
  }
}

