import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';
import 'package:online_learning_design/presentation/Course/presentation/componant/build_course_card.dart';
import 'package:online_learning_design/presentation/Course/presentation/componant/build_tab.dart';

class BuildCourseList extends StatelessWidget {
 const BuildCourseList({
    super.key,
    required this.courses,
    required this.selectedFilter,
    this.isLoading = false,
  });
  final List<CourseEntity> courses;
  final CourseFilter selectedFilter;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).choiceyourcourse,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              BuildTab(
                filter: CourseFilter.all,
                isSelected: selectedFilter == CourseFilter.all,
              ),

              BuildTab(
                filter: CourseFilter.popular,
                isSelected: selectedFilter == CourseFilter.popular,
              ),
              BuildTab(
                filter: CourseFilter.new_,
                isSelected: selectedFilter == CourseFilter.new_,
              ),
            ],
          ),
          const SizedBox(height: 15),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: isLoading ? 5 : courses.length,
            itemBuilder: (context, index) {
              {
                if (isLoading) {
                  return Skeletonizer(
                    enabled: true,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                } else {
                  return BuildCourseCard(course: courses[index]);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
