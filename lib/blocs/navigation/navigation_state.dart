import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class NavigationState extends Equatable{
  NavigationState([List props = const []]) : super([props]);
}

class InitialState extends NavigateState{
  @override
  String toString() => "InitialState";
}

class NavigateState extends NavigationState{

  @override
  String toString() => "NavigateState";
}

class SnackBarState extends NavigationState{

  @override
  String toString() => "SnackBarState";
}