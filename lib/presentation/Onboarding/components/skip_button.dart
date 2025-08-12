import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Onboarding/domin/entities/onboarding_entity.dart';
import 'package:online_learning_design/presentation/Onboarding/onboardingbloc/onboarding_bloc.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onboardingPages});

  final List<OnboardingEntity> onboardingPages;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, right: 10.0),
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            int currentPage = 0;
            if (state is OnboardingPageState) {
              currentPage = state.currentPage;
            }
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (currentPage < onboardingPages.length - 1)
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<OnboardingBloc>(
                        context,
                      ).add(OnboardingCompleted());
                    },
                    child: Text(
                      S.of(context).skip,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
