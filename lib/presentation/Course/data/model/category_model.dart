import 'package:online_learning_design/presentation/Course/domin/Entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name']);
  }
}
