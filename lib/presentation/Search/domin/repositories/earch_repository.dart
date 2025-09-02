import 'package:online_learning_design/presentation/Search/domin/entities/course_entity.dart';
import 'package:online_learning_design/presentation/Search/domin/entities/filter_options_entity.dart';

abstract class SearchRepository {
  Future<List<CourseEntity>> searchCourses({
    String? query,
    FilterEntity? filters,
  });
}
