import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';
import 'package:online_learning_design/presentation/Course/data/DataSource/course_remote_data_source.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_entity.dart';
import 'package:online_learning_design/presentation/Search/domin/repositories/course_repository.dart';

class CourseRepositoryImpl implements CoursesRepository {
  final CourseRemoteDataSource remoteDataSource;

  CourseRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      final data = await remoteDataSource.fetchCourses();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
