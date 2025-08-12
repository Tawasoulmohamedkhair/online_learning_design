import 'package:equatable/equatable.dart';

class OnboardingEntity extends Equatable {
  final String title;
  final String subtitle;
  final String imagePath;

  const OnboardingEntity({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
