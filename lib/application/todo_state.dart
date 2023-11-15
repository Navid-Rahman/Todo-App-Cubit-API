part of '../application/todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoSuccess extends TodoState {
  final List<TodoModel> todos;

  TodoSuccess(this.todos);
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);
}
