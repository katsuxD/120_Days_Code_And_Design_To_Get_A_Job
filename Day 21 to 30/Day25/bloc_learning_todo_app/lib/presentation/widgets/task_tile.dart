import 'package:bloc_learning_todo_app/models/task.dart';
import 'package:bloc_learning_todo_app/presentation/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../blocs/bloc_exports.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeteleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.star_outlined),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      //Text(DateFormat("dd-MMMM-yy")
                      //    .format(DateTime.parse(task.date)))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(children: [
            Checkbox(
              value: task.isDone,
              onChanged: (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              },
            ),
            PopupMenu(
              task: task,
              cancerOrDeleteCallBack: () => _removeOrDeleteTask(context, task),
            )
          ]),
        ],
      ),
    );
  }
}

// ListTile(
//       onLongPress: () => _removeOrDeleteTask(context, task),
//       title: Text(
//         task.title,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//             decoration: task.isDone! ? TextDecoration.lineThrough : null),
//       ),
//       trailing: Checkbox(
//         value: task.isDone,
//         onChanged: (value) {
//           context.read<TasksBloc>().add(UpdateTask(task: task));
//         },
//       ),
//     );