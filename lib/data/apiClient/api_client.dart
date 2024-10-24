import 'package:grocery_app/core/app_export.dart';

class ApiClient extends GetConnect {
  // Base URL for the API
  final String baseUrl = 'https://localhost:7130/api';

  // User-related APIs
  Future<Response> getUser(int userId) async {
    final response = await get('$baseUrl/users/$userId');
    return response;
  }

  Future<Response> createUser(Map<String, dynamic> userData) async {
    final response = await post('$baseUrl/users', userData);
    return response;
  }

  Future<Response> updateUser(int userId, Map<String, dynamic> userData) async {
    final response = await put('$baseUrl/users/$userId', userData);
    return response;
  }

  Future<Response> deleteUser(int userId) async {
    final response = await delete('$baseUrl/users/$userId');
    return response;
  }

  // Post-related APIs
  Future<Response> getPost(int postId) async {
    final response = await get('$baseUrl/posts/$postId');
    return response;
  }

  Future<Response> createPost(Map<String, dynamic> postData) async {
    final response = await post('$baseUrl/posts', postData);
    return response;
  }

  Future<Response> updatePost(int postId, Map<String, dynamic> postData) async {
    final response = await put('$baseUrl/posts/$postId', postData);
    return response;
  }

  Future<Response> deletePost(int postId) async {
    final response = await delete('$baseUrl/posts/$postId');
    return response;
  }

  // Add more APIs as needed
}
