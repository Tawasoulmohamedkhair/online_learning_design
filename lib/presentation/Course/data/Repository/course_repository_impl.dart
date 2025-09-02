import 'package:online_learning_design/presentation/Course/data/DataSource/course_remote_data_source.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/category_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';

import '../../domin/Repository/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource remoteDataSource;

  CourseRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<CourseEntity>> getCourses({required CourseFilter filter}) {
    return remoteDataSource.getCourses(filter: filter);
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    return [
      CategoryEntity(name: "Design"),
      CategoryEntity(name: "Programming"),
      CategoryEntity(name: "Business"),
    ];
  }
}
