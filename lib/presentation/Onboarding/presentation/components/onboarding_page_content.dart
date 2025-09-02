import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_learning_design/presentation/Onboarding/domin/entities/onboarding_entity.dart';
import 'onboarding_page_indicator.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingEntity data;
  final int currentPage;
  final int totalPages;

  const OnboardingPageContent({
    super.key,
    required this.data,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(data.imagePath, height: 250),
        const SizedBox(height: 50),
        Text(
          data.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            data.subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            totalPages,
            (index) =>
                OnboardingPageIndicator(index: index, currentPage: currentPage),
          ),
        ),
        SizedBox(height: 60),
      ],
    );
  }
}
