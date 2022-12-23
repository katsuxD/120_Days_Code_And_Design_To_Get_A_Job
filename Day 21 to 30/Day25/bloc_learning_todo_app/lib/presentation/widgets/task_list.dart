import 'package:bloc_learning_todo_app/models/task.dart';
import 'package:bloc_learning_todo_app/presentation/widgets/task_tile.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isExpanded) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Text\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: task.title),
                      const TextSpan(
                        text: '\n \n Description\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: task.description)
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
    // return Expanded(
    //   child: ListView.builder(
    //     itemCount: taskList.length,
    //     itemBuilder: (context, index) {
    //       var task = taskList[index];
    //       return TaskTile(task: task);
    //     },
    //   ),
    // );
