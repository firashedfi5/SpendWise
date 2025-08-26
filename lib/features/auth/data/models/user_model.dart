import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userId;
  final String? username;
  final String? email;

  const UserModel({this.userId, this.username, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json['userId'] as String?,
    username: json['username'] as String?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'username': username,
    'email': email,
  };

  UserModel copyWith({String? userId, String? username, String? email}) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [userId, username, email];
}
