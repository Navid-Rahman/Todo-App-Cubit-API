import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_api/application/todo_cubit.dart';
import 'package:todo_app_cubit_api/constants/constants.dart';

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
      appBar: kAppBarStyle,
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
                      style: kTitleTextStyle,
                    ),
                    subtitle: Text(
                      state.todos[index].completed.toString(),
                      style: kSubtitleTextStyle.copyWith(
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
