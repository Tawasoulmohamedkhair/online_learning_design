import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/category_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_bloc.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_event.dart';

class CategoryListWidget extends StatelessWidget {
  final List<CategoryEntity> categories;

  const CategoryListWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final colors = [const Color(0xFFE8F1FE), const Color(0xFFF1E6F7)];
          return InkWell(
            onTap: () {
              context.read<CourseBloc>().add(
                LoadCourseData(
                  categoryName: category.name,
                  filter: CourseFilter.all,
                ),
              );
            },

            child: Container(
              width: 150,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Text(
                      category.name,
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
