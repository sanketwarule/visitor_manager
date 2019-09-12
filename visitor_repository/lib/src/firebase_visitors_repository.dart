import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visitor_repository/visitor_repository.dart';

class FirebaseVisitorsRepository implements VisitorsRepository{

  final visitorCollection = Firestore.instance.collection('visitors');
  @override
  Future<void> addNewVisitor(Visitor visitor) {
    // TODO: implement addNewVisitor
    return visitorCollection.add(visitor.toEntity().toDocument());
  }

  @override
  Future<void> deleteVisitor(Visitor visitor) {
    // TODO: implement deleteVisitor
    return visitorCollection.document(visitor.id).delete();
  }

  @override
  Future<void> updateVisitor(Visitor update) {
    // TODO: implement updateVisitor
    return visitorCollection.document(update.id).updateData(update.toEntity().toDocument());
  }

  @override
  Stream<List<Visitor>> visitors() {
    // TODO: implement visitors

    return visitorCollection.snapshots().map((snapshot){
      return snapshot.documents.map((doc) => Visitor.fromEntity(VisitorEntity.fromSnapshot(doc))).toList();
    });
  }

  @override
  Future<bool> isAlreadyRegistered(Visitor visitor) async{
    // TODO: implement isAlreadyRegistered
//    var document = await Firestore.instance.collection('COLLECTION_NAME').document('TESTID1');
    final QuerySnapshot result = await visitorCollection
        .where('mobile', isEqualTo: visitor.mobile)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    return documents.length == 1;
  }


}