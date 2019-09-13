import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent{

  @override
  String toString() {
    // TODO: implement toString
    return 'AppStarted';
  }
}

class AdminAuthentication extends AuthenticationEvent{
  final String email;
  final String password;

  AdminAuthentication(this.email, this.password);

  @override
  String toString() {
    // TODO: implement toString
    return 'AdminAuthentication { email : $email , password : $password}';
  }
}