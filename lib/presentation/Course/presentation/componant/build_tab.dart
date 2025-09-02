import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_bloc.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_event.dart';
import 'package:online_learning_design/generated/l10n.dart';

class BuildTab extends StatelessWidget {
  const BuildTab({super.key, required this.filter, required this.isSelected});

  final CourseFilter filter;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final title = switch (filter) {
      CourseFilter.all => S.of(context).all,
      CourseFilter.popular => S.of(context).popular,
      CourseFilter.new_ => S.of(context).New,
    };

    return InkWell(
      onTap: () {
        context.read<CourseBloc>().add(LoadCourseData(filter: filter));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF5560FB) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
