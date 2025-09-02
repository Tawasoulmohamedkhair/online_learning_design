import 'package:flutter/material.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int index;
  final int currentPage;

  const OnboardingPageIndicator({
    super.key,
    required this.index,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      width: index == currentPage ? 20.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: index == currentPage ? Colors.blue : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
