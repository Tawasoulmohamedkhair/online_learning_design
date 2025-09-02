import 'package:online_learning_design/presentation/Course/domin/Entity/course_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';

import '../Repository/course_repository.dart';

class GetCourses {
  final CourseRepository repository;

  GetCourses(this.repository);

  Future<List<CourseEntity>> call({
    CourseFilter? filter,
    String? categoryName,
  }) {
    return repository.getCourses(filter: CourseFilter.all);
  }
}
