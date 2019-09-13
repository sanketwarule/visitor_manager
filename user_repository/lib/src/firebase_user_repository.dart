import '../user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserRepository implements UserRepository{

  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> authenticate() {
    // TODO: implement authenticate
//    getUserId() != null ? _firebaseAuth.signOut() : _firebaseAuth.signInWithEmailAndPassword(email: null, password: null)
//    return _firebaseAuth.signInWithEmailAndPassword(email: null, password: null);
  }

  @override
  Future<void> guest() {
    // TODO: implement guest
    return _firebaseAuth.signInAnonymously();
  }

  @override
  Future<String> getUserId() async{
    // TODO: implement getUserId
    return (await _firebaseAuth.currentUser()).uid;
  }

  @override
  Future<bool> isAuthenticated() async{
    // TODO: implement isAuthenticated
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;  }

}