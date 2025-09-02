import 'package:online_learning_design/presentation/Search/data/model/course_model.dart';
import 'package:online_learning_design/presentation/Search/domin/entities/course_entity.dart';
import 'package:online_learning_design/presentation/Search/domin/entities/filter_options_entity.dart';
import 'package:online_learning_design/presentation/Search/domin/repositories/earch_repository.dart';

class SearchRemoteDataSourceImpl implements SearchRepository {
  final List<CourseModel> allCourses = [
    CourseModel(
      title: 'Visual Design',
      instructor: 'Bert Pullman',
      price: 250,
      duration: '14-20 Hours',
      category: '',
    ),
    CourseModel(
      title: 'UI/UX Design',
      instructor: 'Alex Johnson',
      price: 150,
      duration: '8-14 Hours',
      category: '',
    ),
    CourseModel(
      title: 'Coding in Python',
      instructor: 'Jane Doe',
      price: 200,
      duration: '20-24 Hours',
      category: '',
    ),
    CourseModel(
      title: 'Music Production',
      instructor: 'John Smith',
      price: 100,
      duration: '3-8 Hours',
      category: '',
    ),
    CourseModel(
      title: 'Data Science',
      instructor: 'Emily White',
      price: 300,
      duration: '24-30 Hours',
      category: '',
    ),
  ];

  @override
  Future<List<CourseEntity>> searchCourses({
    String? query,
    FilterEntity? filters,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    List<CourseEntity> filteredCourses = allCourses;

    // Apply search query filter
    if (query != null && query.isNotEmpty) {
      filteredCourses =
          filteredCourses
              .where(
                (course) =>
                    course.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }

    if (filters != null) {
      filteredCourses =
          filteredCourses
              .where((course) => course.price >= filters.priceRange.start)
              .toList();
    }

    return filteredCourses;
  }
}
