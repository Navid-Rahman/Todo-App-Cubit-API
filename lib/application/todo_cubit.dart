import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repository/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository todoRepository;

  TodoCubit(this.todoRepository) : super(TodoInitial());

  Future<void> getTodo() async {
    emit(TodoLoading());
  }
}
