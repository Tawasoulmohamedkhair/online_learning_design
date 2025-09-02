
import 'package:online_learning_design/presentation/Search/domin/entities/course_entity.dart';

class CourseModel extends CourseEntity {
   CourseModel({
    required super.title,
    required super.instructor,
    required super.price,
    required super.duration,
    required super.category,    
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      title: json['title'] as String,
      instructor: json['instructor'] as String,
      price: json['price'] as double,
      duration: json['duration'] as String,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'instructor': instructor,
      'price': price,
      'duration': duration,
    };
  }
}
