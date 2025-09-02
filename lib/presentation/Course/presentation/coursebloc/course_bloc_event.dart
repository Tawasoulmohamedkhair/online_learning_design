
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';

abstract class CourseEvent {}

class LoadCourseData extends CourseEvent {
  final CourseFilter filter;
  final String? categoryName;

  LoadCourseData({required this.filter, this.categoryName});
}

class SearchCoursesEvent extends CourseEvent {
  final String query;
  SearchCoursesEvent({required this.query});
}
