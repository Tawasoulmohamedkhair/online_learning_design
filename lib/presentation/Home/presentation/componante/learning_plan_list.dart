// lib/features/home/presentation/widgets/learning_plan_list.dart
import 'package:flutter/material.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Home/domin/entities/learning_plan_entity.dart';

class LearningPlanList extends StatelessWidget {
  final List<LearningPlanEntity> learningPlans;

  const LearningPlanList({super.key, required this.learningPlans});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).learningPlan,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: learningPlans.length,
            itemBuilder: (context, index) {
              final plan = learningPlans[index];

              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            value: plan.progress / plan.total,
                            strokeWidth: 2,
                            color: Colors.blue,
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          S.of(context).packagingDesign,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      '${plan.progress}/${plan.total}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
