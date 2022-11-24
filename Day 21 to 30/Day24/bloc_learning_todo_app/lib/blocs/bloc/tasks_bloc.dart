// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:bloc_learning_todo_app/models/task.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emit(TasksState(
      allTask: List.from(state.allTask)..add(event.task),
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emit(TasksState(
      allTask: List.from(state.allTask)..add(event.task),
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emitter) {
    final state = this.state;
    emit(TasksState(
      allTask: List.from(state.allTask)..add(event.task),
    ));
  }
}
