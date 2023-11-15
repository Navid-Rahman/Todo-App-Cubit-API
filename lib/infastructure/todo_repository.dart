import 'dart:convert';

import 'package:http/http.dart' as http;

import '../domain/todo_model.dart';

class TodoRepository {
  Future<List<TodoModel>> getTodos() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';

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
