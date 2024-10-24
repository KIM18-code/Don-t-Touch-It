// lib/controllers/auth_controller.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';

class AuthController {
  Future<bool> login(AuthModel authModel) async {
    final response = await http.post(
      Uri.parse('https://localhost:7130/api/authentication/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(authModel.toJson()),
    );

    if (response.statusCode == 200) {
      // Handle successful login
      return true;
    } else {
      // Handle login error
      return false;
    }
  }
}
