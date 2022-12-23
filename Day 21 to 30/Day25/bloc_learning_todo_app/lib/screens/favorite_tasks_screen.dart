import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../presentation/widgets/task_list.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';
  //TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.favoriteTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${taskList.length} Tasks',
                ),
              ),
            ),
            TasksList(taskList: taskList),
          ],
        );
      },
    );
  }
}
