// lib/features/home/domain/repositories/home_repository.dart
import 'package:fpdart/fpdart.dart';
import 'package:online_learning_design/core/error/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, Map<String, dynamic>>> getHomeData();
}
