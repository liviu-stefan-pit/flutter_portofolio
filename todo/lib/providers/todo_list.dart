import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import '../models/todo.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', title: 'Buy milk', description: '2L of milk'),
      Todo(id: '2', title: 'Buy eggs', description: '12 eggs'),
      Todo(id: '3', title: 'Buy bread', description: '1 loaf of bread'),
    ]);
  }

  @override
  List<Object> get props => [todos];

  @override
  bool get stringify => true;

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}

class TodoList extends StateNotifier<TodoListState> {
  TodoList() : super(TodoListState.initial());

  void addTodo(String todoTitle) {
    final newTodo = Todo(title: todoTitle);
    final newTodos = [...state.todos, newTodo];

    state = state.copyWith(todos: newTodos);
  }

  void editTodo(String id, String todoTitle) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          title: todoTitle,
          description: todo.description,
          isComplete: todo.isComplete,
        );
      }
      return todo;
    }).toList();

    state = state.copyWith(todos: newTodos);
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
          id: id,
          title: todo.title,
          description: todo.description,
          isComplete: !todo.isComplete,
        );
      }
      return todo;
    }).toList();

    state = state.copyWith(todos: newTodos);
  }

  void removeTodo(Todo todo) {
    final newTodos = state.todos.where((Todo t) => t.id != todo.id).toList();

    state = state.copyWith(todos: newTodos);
  }
}
