import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visitor_repository/visitor_repository.dart';

class FirebaseVisitorsRepository implements VisitorsRepository{

  final visitorCollection = Firestore.instance.collection('visitors');
  @override
  Future<void> addNewVisitor(Visitor visitor) {
//    return visitorCollection.add(visitor.toEntity().toDocument());     // creates a autoId for document id
    return visitorCollection.document(visitor.mobile).setData(visitor.toEntity().toDocument());   // creates a user defined id (here mobile is unique there fore mobile is used as document id)
  }

  @override
  Future<void> deleteVisitor(Visitor visitor) {
    return visitorCollection.document(visitor.id).delete();
  }

  @override
  Future<void> updateVisitor(Visitor update) {
    return visitorCollection.document(update.id).updateData(update.toEntity().toDocument());
  }

  @override
  Stream<List<Visitor>> visitors() {
    return visitorCollection.snapshots().map((snapshot){
      return snapshot.documents.map((doc) => Visitor.fromEntity(VisitorEntity.fromSnapshot(doc))).toList();
    });
  }

  @override
  Future<bool> isAlreadyRegistered(Visitor visitor) async{
    final docId = await visitorCollection.document(visitor.mobile).get();
    return docId.exists;
  }


}