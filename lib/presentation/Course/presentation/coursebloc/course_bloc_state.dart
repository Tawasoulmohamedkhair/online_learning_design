import 'package:online_learning_design/presentation/Course/domin/Entity/category_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<CourseEntity> courses;
  final List<CategoryEntity> categories;
  final CourseFilter selectedFilter;

  CourseLoaded({
    required this.courses,
    required this.categories,
    required this.selectedFilter,
  });
}

class CourseError extends CourseState {
  final String message;
  CourseError({required this.message});
}
