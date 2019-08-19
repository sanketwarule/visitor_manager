import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable{
  AuthenticationState([List props = const[]]) : super(props);
}

class Uninitialized extends AuthenticationState{

  @override
  String toString() {
    // TODO: implement toString
    return 'Uninitialized';
  }
}

class Authenticated extends AuthenticationState{

  final String userId;

  Authenticated(this.userId) : super([userId]);
  @override
  String toString() {
    // TODO: implement toString
    return 'Authenticated {userId : $userId}';
  }
}

class UnAuthenticated extends AuthenticationState{

  @override
  String toString() {
    // TODO: implement toString
    return 'UnAuthenticated';
  }
}