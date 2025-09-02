import 'package:online_learning_design/presentation/Home/domin/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.name, required super.profileImageUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'profileImageUrl': profileImageUrl};
  }
}
