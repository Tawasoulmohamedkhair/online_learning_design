part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingState extends Equatable {
  const OnboardingState();
  @override
  List<Object> get props => [];
}

class OnboardingInitialState extends OnboardingState {
  const OnboardingInitialState();
}

class OnboardingPageState extends OnboardingState {
  final int currentPage;
  const OnboardingPageState(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}

class OnboardingCompletedState extends OnboardingState {
  const OnboardingCompletedState();
}
