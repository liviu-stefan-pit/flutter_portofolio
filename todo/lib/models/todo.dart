import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Todo extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isComplete;

  Todo({
    String? id,
    required this.title,
    this.description = '',
    this.isComplete = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, title, description, isComplete];

  @override
  bool get stringify => true;
}

enum Filter {
  all,
  active,
  completed,
}
