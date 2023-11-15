import 'package:flutter/material.dart';
import 'package:todo_app_cubit_api/presentation/todo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: TodoPage(),
    );
  }
}
