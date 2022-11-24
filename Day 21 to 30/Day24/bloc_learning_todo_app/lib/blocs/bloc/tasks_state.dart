part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTask;
  const TasksState({
    this.allTask = const <Task>[],
  });

  @override
  List<Object> get props => [allTask];
}
