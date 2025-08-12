// data/onboarding/repositories/onboarding_repository_impl.dart
import 'package:online_learning_design/presentation/Onboarding/domin/entities/onboarding_entity.dart';
import 'package:online_learning_design/presentation/Onboarding/domin/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final String title1;
  final String subtitle1;
  final String title2;
  final String subtitle2;
  final String title3;
  final String subtitle3;

  OnboardingRepositoryImpl({
    required this.title1,
    required this.subtitle1,
    required this.title2,
    required this.subtitle2,
    required this.title3,
    required this.subtitle3,
  });

  @override
  List<OnboardingEntity> getOnboardingPages() {
    return [
      OnboardingEntity(
        title: title1,
        subtitle: subtitle1,
        imagePath: 'assets/svg/pana.svg',
      ),
      OnboardingEntity(
        title: title2,
        subtitle: subtitle2,
        imagePath: 'assets/svg/illustration.svg',
      ),
      OnboardingEntity(
        title: title3,
        subtitle: subtitle3,
        imagePath: 'assets/svg/online-study.svg',
      ),
    ];
  }
}
