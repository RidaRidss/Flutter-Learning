import 'package:http/http.dart' as http;
import './main.dart';
import 'dart:convert';

class ApiService {
  static Future<List<dynamic>> _get(String url) async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  static Future<List<dynamic>> getUserList() async {
    return await _get('${Url.BASE_API_URL}/users');
  }

  static Future<List<dynamic>> getPostList() async {
    return await _get('${Url.BASE_API_URL}/posts');
  }

  static Future<dynamic> getPostDetail(int postId) async {
    return await _get('${Url.BASE_API_URL}/posts/{$postId}');
  }

  static Future<dynamic> getPostComments(int postId) async {
    return await _get('${Url.BASE_API_URL}/posts/$postId/comments');
  }

  static Future<bool> addPost(Map<String, dynamic> post) async {
    try {
      final response = await http.post('${Url.BASE_API_URL}/posts', body: post);
      return response.statusCode == 201;
    } catch (ex) {
      return false;
    }
  }
}
