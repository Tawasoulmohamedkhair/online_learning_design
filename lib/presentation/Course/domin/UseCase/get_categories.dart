import 'package:online_learning_design/presentation/Course/domin/Entity/category_entity.dart';

import '../Repository/course_repository.dart';

class GetCategories {
  final CourseRepository repository;
  GetCategories(this.repository);

  Future<List<CategoryEntity>> call() {
    return repository.getCategories();
  }
}
