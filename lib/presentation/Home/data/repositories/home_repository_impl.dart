// lib/features/home/data/repositories/home_repository_impl.dart
import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/exceptions.dart';
import 'package:online_learning_design/core/error/failures.dart';
import 'package:online_learning_design/presentation/Home/domin/entities/learning_progress_entity.dart';
import 'package:online_learning_design/presentation/Home/domin/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> getHomeData() async {
    try {
      final data = await remoteDataSource.getHomeData();
      return Right({
        "user": data["user"],
        "learningPlans": data["learningPlans"],
        "progress": LearningProgressEntity(
          learnedMinutes: 46,
          targetMinutes: 60,
        ),
      });
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
