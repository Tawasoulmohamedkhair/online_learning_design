import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_event.dart';
import 'package:online_learning_design/presentation/Course/presentation/coursebloc/course_bloc_state.dart';

import '../../domin/UseCase/get_categories.dart';
import '../../domin/UseCase/get_courses.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCourses getCourses;
  final GetCategories getCategories;

  List<CourseEntity> _allCourses = [];

  CourseBloc({required this.getCourses, required this.getCategories})
    : super(CourseInitial()) {
    on<LoadCourseData>(_onLoadCourseData);
    on<SearchCoursesEvent>(_onSearchCourses);
  }

  Future<void> _ensureAllLoaded() async {
    if (_allCourses.isEmpty) {
      _allCourses = await getCourses.call(filter: CourseFilter.all);
    }
  }

  Future<void> _onLoadCourseData(
    LoadCourseData event,
    Emitter<CourseState> emit,
  ) async {
    emit(CourseLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      await _ensureAllLoaded();

      List<CourseEntity> filtered;
      switch (event.filter) {
        case CourseFilter.all:
          filtered = _allCourses;
          break;
        case CourseFilter.popular:
          filtered = _allCourses.take(2).toList();
          break;
        case CourseFilter.new_:
          filtered = _allCourses.skip(2).toList();
          break;
      }

      final categories = await getCategories.call();

      emit(
        CourseLoaded(
          courses: filtered,
          categories: categories,
          selectedFilter: event.filter,
        ),
      );
    } catch (e) {
      emit(CourseError(message: e.toString()));
    }
  }

  Future<void> _onSearchCourses(
    SearchCoursesEvent event,
    Emitter<CourseState> emit,
  ) async {
    try {
      await _ensureAllLoaded();

      final q = event.query.trim().toLowerCase();
      final results =
          _allCourses.where((c) {
            return c.title.toLowerCase().contains(q) ||
                c.instructor.toLowerCase().contains(q);
          }).toList();

      if (state is CourseLoaded) {
        final s = state as CourseLoaded;
        emit(
          CourseLoaded(
            courses: results,
            categories: s.categories,
            selectedFilter: s.selectedFilter,
          ),
        );
      } else {
        emit(
          CourseLoaded(
            courses: results,
            categories: const [],
            selectedFilter: CourseFilter.all,
          ),
        );
      }
    } catch (e) {
      emit(CourseError(message: e.toString()));
    }
  }
}
