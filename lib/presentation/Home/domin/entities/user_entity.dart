import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String profileImageUrl;

  const UserEntity({required this.name, required this.profileImageUrl});

  @override
  List<Object?> get props => [name, profileImageUrl];
}


