import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String title;
  final String instructor;
  final double price;
  final String duration;
  final String imageUrl;

  const CourseEntity({
    required this.title,
    required this.instructor,
    required this.price,
    required this.duration,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [title, instructor, price, duration, imageUrl];
}
