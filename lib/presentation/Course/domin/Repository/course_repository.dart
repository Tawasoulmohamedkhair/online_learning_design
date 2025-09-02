import 'package:online_learning_design/presentation/Course/domin/Entity/category_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';

abstract class CourseRepository {
  Future<List<CourseEntity>> getCourses({required CourseFilter filter}) async {
    final allCourses = [
      const CourseEntity(
        title: 'Product Design v1.0',
        instructor: '',
        imageUrl: '',
        price: 20,
        duration: '',
      ),
      const CourseEntity(
        title: 'Java Development',
        instructor: '',
        imageUrl: '',
        price: 20,
        duration: '',
      ),
      const CourseEntity(
        title: 'Visual Design',
        instructor: '',
        imageUrl: '',
        price: 20,
        duration: '',
      ),
    ];

    switch (filter) {
      case CourseFilter.all:
        return allCourses;
      case CourseFilter.popular:
        return allCourses.sublist(0, 2);
      case CourseFilter.new_:
        return allCourses.sublist(2);
    }
  }

  Future<List<CategoryEntity>> getCategories();
}
