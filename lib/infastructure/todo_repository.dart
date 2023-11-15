import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app_cubit_api/constants/api_endpoints.dart';

import '../domain/todo_model.dart';

class TodoRepository {
  Future<List<TodoModel>> getTodos() async {
    const url = ApiEndpoints.BASE_URL;

    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) => TodoModel.fromJson(e)).toList();
      return result;
    } else {
      throw Exception(
          'Exception: Failed to load todos/n StatusCode: ${response.statusCode}');
    }
  }
}
