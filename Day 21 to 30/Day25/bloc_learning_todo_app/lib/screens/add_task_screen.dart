import 'package:bloc_learning_todo_app/blocs/task_bloc/tasks_bloc.dart';
import 'package:bloc_learning_todo_app/models/task.dart';
import 'package:bloc_learning_todo_app/services/guid_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Add tasks",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: titleController,
            autofocus: true,
            decoration: const InputDecoration(
              label: Text("Input text"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: descriptionController,
            autofocus: true,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              label: Text("Description"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var task = Task(
                        title: titleController.text,
                        description: descriptionController.text,
                        id: GUIDGen.generate(),
                        date: DateTime.now().toString());
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text("Add")),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
            ],
          ),
        ],
      ),
    );
  }
}
