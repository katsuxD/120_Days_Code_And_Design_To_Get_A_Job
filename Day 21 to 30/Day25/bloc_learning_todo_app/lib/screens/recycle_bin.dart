import 'package:bloc_learning_todo_app/blocs/bloc_exports.dart';
import 'package:bloc_learning_todo_app/screens/drawer.dart';
import 'package:flutter/material.dart';

import '../presentation/widgets/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: const DrawerCustom(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} Tasks',
                  ),
                ),
              ),
              TasksList(taskList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
