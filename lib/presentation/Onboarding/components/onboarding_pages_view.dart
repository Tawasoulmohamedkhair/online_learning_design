
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/presentation/Onboarding/domin/entities/onboarding_entity.dart';
import 'package:online_learning_design/presentation/Onboarding/onboardingbloc/onboarding_bloc.dart';
import 'package:online_learning_design/presentation/Onboarding/components/onboarding_page_content.dart';

class OnboardingPagesView extends StatelessWidget {
  final PageController pageController;
  final List<OnboardingEntity> onboardingPages;

  const OnboardingPagesView({
    super.key,
    required this.pageController,
    required this.onboardingPages,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (blocContext, state) {
        int currentPage = 0;
        if (state is OnboardingPageState) {
          currentPage = state.currentPage;
        }

        return PageView.builder(
          controller: pageController,
          itemCount: onboardingPages.length,
          onPageChanged: (int index) {
            BlocProvider.of<OnboardingBloc>(
              blocContext,
            ).add(OnboardingPageChanged(index));
          },
          itemBuilder: (context, index) {
            return OnboardingPageContent(
              data: onboardingPages[index],
              currentPage: currentPage,
              totalPages: onboardingPages.length,
            );
          },
        );
      },
    );
  }
}
