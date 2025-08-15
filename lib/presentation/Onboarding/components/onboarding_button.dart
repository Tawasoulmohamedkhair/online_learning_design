import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/core/components/custom_elevated_button.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Onboarding/domin/entities/onboarding_entity.dart';
import 'package:online_learning_design/presentation/Onboarding/onboardingbloc/onboarding_bloc.dart';
import 'package:online_learning_design/presentation/auth/login_screen.dart';
import 'package:online_learning_design/presentation/auth/sign_up_screen.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            int currentPage = 0;
            if (state is OnboardingPageState) {
              currentPage = state.currentPage;
            }
            if (currentPage == onboardingPages.length - 1) {
              return SizedBox(
                width: double.infinity,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      width: 161,
                      backgroundColor: const Color(0xFF3F5EFB),

                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                        log(S.of(context).sign_up);
                      },
                      label: Text(
                        S.of(context).sign_up,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffF4F3FD),
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      width: 161,
                      backgroundColor: Color(0xff858597),
                      onPressed: () {
                        BlocProvider.of<OnboardingBloc>(
                          context,
                        ).add(OnboardingCompleted());
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                        log(S.of(context).sign_in);
                      },

                      label: Text(
                        S.of(context).sign_in,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xffF4F3FD),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
