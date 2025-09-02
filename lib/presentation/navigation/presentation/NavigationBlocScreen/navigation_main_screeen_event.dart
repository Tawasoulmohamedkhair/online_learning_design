part of 'navigation_main_screeen_bloc.dart';

abstract class NavigationMainScreeenEvent extends Equatable {
  const NavigationMainScreeenEvent();

  @override
  List<Object> get props => [];
}

class NavigationItemSelected extends NavigationMainScreeenEvent {
  final int index;
  const NavigationItemSelected(this.index);

  @override
  List<Object> get props => [index];
}
