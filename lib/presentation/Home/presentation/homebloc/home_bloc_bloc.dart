import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/core/usecase/usecase.dart';
import 'package:online_learning_design/presentation/Home/domin/entities/learning_plan_entity.dart';
import 'package:online_learning_design/presentation/Home/domin/entities/user_entity.dart';
import 'package:online_learning_design/presentation/Home/domin/entities/learning_progress_entity.dart';
import 'package:online_learning_design/presentation/Home/domin/usecases/get_home_data.dart';
import 'package:online_learning_design/presentation/Home/presentation/homebloc/home_bloc_event.dart';
import 'package:online_learning_design/presentation/Home/presentation/homebloc/home_bloc_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData getHomeData;

  HomeBloc({required this.getHomeData}) : super(HomeInitial()) {
    on<FetchHomeData>((event, emit) async {
      emit(HomeLoading());
      final result = await getHomeData(NoParams());
      result.fold(
        (failure) => emit(const HomeError(message: 'Failed to fetch data')),
        (data) {
          final user = data['user'] as UserEntity;
          final learningPlans =
              data['learningPlans'] as List<LearningPlanEntity>;
          final progress = data['progress'] as LearningProgressEntity;

          emit(
            HomeLoaded(
              user: user,
              learningPlans: learningPlans,
              progress: progress,
            ),
          );
        },
      );
    });
  }
}
