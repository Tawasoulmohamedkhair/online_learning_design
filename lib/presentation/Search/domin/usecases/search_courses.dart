import 'package:online_learning_design/presentation/Search/domin/entities/course_entity.dart';
import 'package:online_learning_design/presentation/Search/domin/entities/filter_options_entity.dart';
import 'package:online_learning_design/presentation/Search/domin/repositories/earch_repository.dart';

class SearchCourses {
  final SearchRepository repository;
  SearchCourses(this.repository);

  Future<List<CourseEntity>> call({
    String? query,
    FilterEntity? filters,
  }) {
    return repository.searchCourses(query: query, filters: filters);
  }
}
