
import 'package:online_learning_design/presentation/Home/domin/entities/learning_plan_entity.dart';

class LearningPlanModel extends LearningPlanEntity {
  const LearningPlanModel({
    required super.title,
    required super.progress,
    required super.total,
  });

  factory LearningPlanModel.fromJson(Map<String, dynamic> json) {
    return LearningPlanModel(
      title: json['title'],
      progress: json['progress'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'progress': progress, 'total': total};
  }
}
