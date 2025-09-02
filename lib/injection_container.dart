import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:online_learning_design/presentation/Course/data/DataSource/course_remote_data_source.dart';
import 'package:online_learning_design/presentation/Course/data/Repository/course_repository_impl.dart';
import 'package:online_learning_design/presentation/Course/domin/Repository/course_repository.dart';
import 'package:online_learning_design/presentation/Onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:online_learning_design/presentation/Onboarding/domin/repositories/onboarding_repository.dart';
import 'package:online_learning_design/presentation/Onboarding/domin/usecases/get_onboarding_pages.dart';

final sl = GetIt.instance;

Future<void> init({
  required String title1,
  required String subtitle1,
  required String title2,
  required String subtitle2,
  required String title3,
  required String subtitle3,
}) async {
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(
      title1: title1,
      subtitle1: subtitle1,
      title2: title2,
      subtitle2: subtitle2,
      title3: title3,
      subtitle3: subtitle3,
    ),
  );

  sl.registerLazySingleton(() => GetOnboardingPages(sl()));
  sl.registerLazySingleton<CourseRemoteDataSource>(
    () => CourseRemoteDataSourceImpl(Dio()),
  );

  sl.registerLazySingleton<CourseRepository>(
    () => CourseRepositoryImpl(remoteDataSource: sl()),
  );
}
