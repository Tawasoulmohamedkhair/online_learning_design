// course_repository.dart (Domain)
import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_entity.dart';

abstract class CoursesRepository {
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();
}
