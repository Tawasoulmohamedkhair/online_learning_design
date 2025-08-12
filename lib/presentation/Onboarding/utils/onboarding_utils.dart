import 'package:flutter/material.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Onboarding/data/model/onboarding_data.dart';
import 'package:online_learning_design/presentation/Onboarding/data/model/onboarding_model.dart';

String getLocalizedTitle(BuildContext context, String key) {
  switch (key) {
    case 'numerousfreetrialcourses':
      return S.of(context).numerousfreetrialcourses;
    case 'quickandeasylearning':
      return S.of(context).quickandeasylearning;
    case 'createyourownstudyplan':
      return S.of(context).createyourownstudyplan;
    default:
      return '';
  }
}

String getLocalizedSubtitle(BuildContext context, String key) {
  switch (key) {
    case 'freecourses':
      return S.of(context).freecourses;
    case 'easyandfastlearning':
      return S.of(context).easyandfastlearning;
    case 'studyaccordingtothestudyplan':
      return S.of(context).studyaccordingtothestudyplan;
    default:
      return '';
  }
}

List<OnboardingModel> getOnboardingPages(BuildContext context) {
  return onboardingData.map((data) {
    return OnboardingModel(
      title: getLocalizedTitle(context, data['titleKey']!),
      subtitle: getLocalizedSubtitle(context, data['subtitleKey']!),
      imagePath: data['imagePath']!,
    );
  }).toList();
}
