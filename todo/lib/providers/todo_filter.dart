import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import '../models/todo.dart';

class ToDoFilterState extends Equatable {
  final Filter activeFilter;

  ToDoFilterState({
    required this.activeFilter,
  });

  factory ToDoFilterState.initial() {
    return ToDoFilterState(activeFilter: Filter.all);
  }

  @override
  List<Object> get props => [activeFilter];

  @override
  bool get stringify => true;

  ToDoFilterState copyWith({
    Filter? activeFilter,
  }) {
    return ToDoFilterState(
      activeFilter: activeFilter ?? this.activeFilter,
    );
  }
}

class ToDoFilter extends StateNotifier<ToDoFilterState> {
  ToDoFilter() : super(ToDoFilterState.initial());

  void changeFilter(Filter filter) {
    state = state.copyWith(activeFilter: filter);
  }
}
