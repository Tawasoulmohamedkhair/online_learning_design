import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({required Object getOnboardingPages})
    : super(const OnboardingInitialState()) {
    on<OnboardingPageChanged>((event, emit) {
      emit(OnboardingPageState(event.pageIndex));
    });

    on<OnboardingCompleted>((event, emit) {
      emit(OnboardingCompletedState());
    });
  }
}
