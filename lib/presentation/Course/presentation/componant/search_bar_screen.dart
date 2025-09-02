import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/generated/l10n.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_bloc.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_event.dart';

class SearchBarScreen extends StatelessWidget {
  const SearchBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFE8FD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Color(0xFF988AB0)),
          hintText: S.of(context).findCousre,
          hintStyle: TextStyle(color: Color(0xFF988AB0)),
          border: InputBorder.none,
        ),
        onChanged: (query) {
          context.read<CourseBloc>().add(SearchCoursesEvent(query: query));
        },
      ),
    );
  }
}
