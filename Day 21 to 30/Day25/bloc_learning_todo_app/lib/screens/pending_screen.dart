import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../presentation/widgets/task_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);

  //TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${state.pendingTasks.length} Pending Tasks |${state.completedTasks.length} Completed',
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
