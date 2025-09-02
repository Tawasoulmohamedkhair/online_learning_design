import 'package:online_learning_design/presentation/Course/domin/Entity/course_entity.dart';

class CourseModel extends CourseEntity {
  const CourseModel({
    required super.title,
    required super.instructor,
    required super.price,
    required super.duration,
    required super.imageUrl,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      title: json['title'],
      instructor: json['instructor'],
      price: json['price'].toDouble(),
      duration: json['duration'],
      imageUrl: json['imageUrl'],
    );
  }
}
