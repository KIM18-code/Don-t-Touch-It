// lib/models/auth_model.dart
class AuthModel {
  String username;
  String password;

  AuthModel({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
