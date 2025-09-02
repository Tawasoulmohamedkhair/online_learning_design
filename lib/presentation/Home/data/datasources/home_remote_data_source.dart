import 'package:online_learning_design/presentation/Home/data/model/learning_plan_entity.dart';
import 'package:online_learning_design/presentation/Home/data/model/user_model.dart';

abstract class HomeRemoteDataSource {
  Future<Map<String, dynamic>> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<Map<String, dynamic>> getHomeData() async {
    await Future.delayed(const Duration(seconds: 1));

    final mockUser = UserModel(
      name: 'Kristin',
      profileImageUrl: 'assets/svg/Avatar.svg',
    );
    final mockLearningPlans = [
      const LearningPlanModel(
        title: 'Packaging Design',
        progress: 40,
        total: 48,
      ),
      const LearningPlanModel(title: 'Product Design', progress: 6, total: 24),
      const LearningPlanModel(title: 'Product', progress: 30, total: 50),
    ];

    return {'user': mockUser, 'learningPlans': mockLearningPlans};
  }
}
