import 'package:flutter/material.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Course/presentation/screens/course_screen.dart';
import 'package:online_learning_design/presentation/Home/domin/entities/learning_progress_entity.dart';

class LearnedTodayCard extends StatelessWidget {
  final LearningProgressEntity progress;

  const LearnedTodayCard({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final percent = progress.learnedMinutes / progress.targetMinutes;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).learnedtoday,

                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CourseScreen()),
                      );
                    },
                    child: Text(
                      S.of(context).mycourses,
                      style: TextStyle(fontSize: 14, color: Colors.blue[600]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "${progress.learnedMinutes}min / ${progress.targetMinutes}min",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: percent,
                backgroundColor: Colors.grey[300],
                color: Colors.orange,
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
