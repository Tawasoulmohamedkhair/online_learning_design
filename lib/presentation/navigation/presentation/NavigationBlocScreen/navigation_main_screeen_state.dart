part of 'navigation_main_screeen_bloc.dart';

abstract class NavigationMainScreeenState extends Equatable {
  const NavigationMainScreeenState(this.currentIndex);
  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}

class NavigationMainScreeenInitial extends NavigationMainScreeenState {
  const NavigationMainScreeenInitial() : super(0);
}

class NavigationMainScreeenChanged extends NavigationMainScreeenState {
  const NavigationMainScreeenChanged(super.index);
}
