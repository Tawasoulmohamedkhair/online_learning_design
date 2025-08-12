import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/core/components/custom_elevated_button.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Onboarding/domin/entities/onboarding_entity.dart';
import 'package:online_learning_design/presentation/Onboarding/onboardingbloc/onboarding_bloc.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
    required this.onboardingPages,
    required PageController pageController,
  }) : _pageController = pageController;

  final List<OnboardingEntity> onboardingPages;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0, left: 20.0, right: 20.0),
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            int currentPage = 0;
            if (state is OnboardingPageState) {
              currentPage = state.currentPage;
            }
            if (currentPage == onboardingPages.length - 1) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    label: Text(
                      S.of(context).sign_up,
                      style: const TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      BlocProvider.of<OnboardingBloc>(
                        context,
                      ).add(OnboardingCompleted());
                    },
                    label: Text(S.of(context).sign_in),
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
