import 'package:dio/dio.dart';
import 'package:online_learning_design/presentation/Course/data/model/course_model.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/category_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_entity.dart';
import 'package:online_learning_design/presentation/Course/domin/Entity/course_filter.dart';

abstract class CourseRemoteDataSource {
  Future<List<CourseEntity>> getCourses({required CourseFilter filter});
  Future<List<CategoryEntity>> getCategories();
  Future<List<CourseModel>> fetchCourses();
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  CourseRemoteDataSourceImpl(this.dio);
  final Dio dio;

  @override
  Future<List<CourseEntity>> getCourses({required CourseFilter filter}) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final allCourses = [
      const CourseEntity(
        title: 'Product Design v1.0',
        instructor: 'Robertson',
        price: 190,
        duration: '16h',
        imageUrl: '',
      ),
      const CourseEntity(
        title: 'Java Development',
        instructor: 'Nguyen',
        price: 190,
        duration: '16h',
        imageUrl: '',
      ),
      const CourseEntity(
        title: 'Visual Design',
        instructor: 'Bert',
        price: 250,
        duration: '14h',
        imageUrl: '',
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

  @override
  Future<List<CategoryEntity>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      const CategoryEntity(name: 'Language'),
      const CategoryEntity(name: 'Painting'),
      const CategoryEntity(name: 'Coding'),
      const CategoryEntity(name: 'Design'),
      const CategoryEntity(name: 'Math'),
    ];
  }

  Future<List<CourseModel>> fetchCourses() async {
    try {
      final response = await dio.get("https://api.example.com/courses");

      if (response.statusCode == 200) {
        final List data = response.data as List;
        return data.map((json) => CourseModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load courses");
      }
    } catch (e) {
      throw Exception("RemoteDataSource error: $e");
    }
  }
}
