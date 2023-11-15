import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../domain/todo_model.dart';
import '../infastructure/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository todoRepository;

  TodoCubit(this.todoRepository) : super(TodoInitial());

  Future<void> fetchTodo() async {
    emit(TodoLoading());

    try {
      final response = await todoRepository.getTodos();
      emit(TodoSuccess(response));
    } catch (exception) {
      emit(TodoError(exception.toString()));
    }
  }
}
