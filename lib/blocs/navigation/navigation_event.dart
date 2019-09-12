import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class NavigationEvent extends Equatable{
  NavigationEvent([List props = const []]) : super([props]);
}

class NavigateEvent extends NavigationEvent{

  @override
  String toString() => "NavigationEvent";
}

class SnackBarEvent extends NavigationEvent{

  @override
  String toString() => "SnackBarEvent";
}

