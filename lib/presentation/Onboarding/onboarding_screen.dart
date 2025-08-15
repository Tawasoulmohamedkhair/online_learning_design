import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/presentation/Onboarding/components/onboarding_button.dart';
import 'package:online_learning_design/presentation/Onboarding/components/onboarding_pages_view.dart';
import 'package:online_learning_design/presentation/Onboarding/components/skip_button.dart';
import 'package:online_learning_design/presentation/Onboarding/data/model/onboarding_model.dart';
import 'package:online_learning_design/presentation/Onboarding/onboardingbloc/onboarding_bloc.dart';
import 'package:online_learning_design/presentation/Onboarding/utils/onboarding_utils.dart';
import 'package:online_learning_design/presentation/auth/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OnboardingModel> onboardingPages = getOnboardingPages(context);

    return BlocProvider(
      create:
          (context) => OnboardingBloc(getOnboardingPages: getOnboardingPages),
      child: BlocListener<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompletedState) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              OnboardingPagesView(
                pageController: _pageController,
                onboardingPages: onboardingPages,
              ),
              SkipButton(onboardingPages: onboardingPages),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: OnboardingButton(
                  onboardingPages: onboardingPages,
                  pageController: _pageController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
