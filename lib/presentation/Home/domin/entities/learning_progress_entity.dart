import 'package:equatable/equatable.dart';

class LearningProgressEntity extends Equatable {
  final int learnedMinutes;
  final int targetMinutes;

  const LearningProgressEntity({
    required this.learnedMinutes,
    required this.targetMinutes,
  });

  @override
  List<Object?> get props => [learnedMinutes, targetMinutes];
}
