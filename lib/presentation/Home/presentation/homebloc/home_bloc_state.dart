import 'package:equatable/equatable.dart';
import 'package:online_learning_design/presentation/Home/domin/entities/learning_plan_entity.dart';
import 'package:online_learning_design/presentation/Home/domin/entities/learning_progress_entity.dart';
import 'package:online_learning_design/presentation/Home/domin/entities/user_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final UserEntity user;
  final List<LearningPlanEntity> learningPlans;
  final LearningProgressEntity progress;

  const HomeLoaded({
    required this.user,
    required this.learningPlans,
    required this.progress,
  });

  @override
  List<Object> get props => [user, learningPlans, progress];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
