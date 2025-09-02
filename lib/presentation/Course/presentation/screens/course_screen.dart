import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/presentation/Course/data/DataSource/course_remote_data_source.dart';
import 'package:online_learning_design/presentation/Course/data/Repository/course_repository_impl.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_bloc.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_event.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_state.dart';
import 'package:online_learning_design/presentation/Course/presentation/componant/build_course_list.dart';
import 'package:online_learning_design/presentation/Course/presentation/componant/category_list_widget.dart';
import 'package:online_learning_design/presentation/Course/presentation/componant/header_course_screen.dart';
import 'package:online_learning_design/presentation/Course/presentation/componant/search_bar_screen.dart';
import '../../domin/UseCase/get_categories.dart';
import '../../domin/UseCase/get_courses.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseDataSource = CourseRemoteDataSourceImpl(Dio());
    final courseRepository = CourseRepositoryImpl(
      remoteDataSource: courseDataSource,
    );
    final getCoursesUseCase = GetCourses(courseRepository);
    final getCategoriesUseCase = GetCategories(courseRepository);

    return BlocProvider(
      create:
          (context) => CourseBloc(
            getCourses: getCoursesUseCase,
            getCategories: getCategoriesUseCase,
          )..add(LoadCourseData(filter: CourseFilter.all)),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                if (state is CourseLoading) {
                  return BuildCourseList(
                    courses: [], // no real courses yet
                    selectedFilter: CourseFilter.all,
                    isLoading: true, // skeletons enabled
                  );
                } else if (state is CourseLoaded) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeaderCourseScreen(),
                        const SizedBox(height: 20),
                        const SearchBarScreen(),
                        const SizedBox(height: 20),

                        CategoryListWidget(categories: state.categories),
                        const SizedBox(height: 20),

                        BuildCourseList(
                          courses: state.courses,
                          selectedFilter: state.selectedFilter,
                        ),
                      ],
                    ),
                  );
                } else if (state is CourseError) {
                  return Center(child: Text('Error: ${state.message}'));
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
