import 'package:equatable/equatable.dart';

class LearningPlanEntity extends Equatable {
  final String title;
  final int progress;
  final int total;

  const LearningPlanEntity({
    required this.title,
    required this.progress,
    required this.total,
  });

  @override
  List<Object?> get props => [title, progress, total];
}
