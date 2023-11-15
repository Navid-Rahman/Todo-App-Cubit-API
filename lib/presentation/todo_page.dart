import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_api/application/todo_cubit.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TodoCubit>().fetchTodo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          'Todo',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0XFFEBE3D5),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TodoSuccess) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFFF3EEEA),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.check_box_outline_blank,
                      color: Color(0XFF1640D6),
                    ),
                    title: Text(
                      state.todos[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0XFF22092C),
                      ),
                    ),
                    subtitle: Text(
                      state.todos[index].completed.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: state.todos[index].completed
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          if (state is TodoError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Text(state.toString());
        },
      ),
    );
  }
}
