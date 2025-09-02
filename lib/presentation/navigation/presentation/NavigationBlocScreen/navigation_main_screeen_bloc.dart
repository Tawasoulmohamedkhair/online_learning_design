import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_main_screeen_event.dart';
part 'navigation_main_screeen_state.dart';

class NavigationMainScreeenBloc
    extends Bloc<NavigationMainScreeenEvent, NavigationMainScreeenState> {
  NavigationMainScreeenBloc() : super(const NavigationMainScreeenInitial()) {
    on<NavigationItemSelected>((event, emit) {
      emit(NavigationMainScreeenChanged(event.index));
    });
  }
}
