import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String name;
  final String email;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
      ];
}
