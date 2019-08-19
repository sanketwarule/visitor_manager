import '../visitor_repository.dart';

abstract class VisitorsRepository{

  Future<void> addNewVisitor(Visitor visitor);

  Future<void> deleteVisitor(Visitor visitor);

  Future<void> updateVisitor(Visitor update);

  Stream<List<Visitor>> visitors();

}