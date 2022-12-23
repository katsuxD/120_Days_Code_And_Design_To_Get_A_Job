import 'package:flutter/material.dart';

import '../../models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancerOrDeleteCallBack;
  const PopupMenu({
    Key? key,
    required this.cancerOrDeleteCallBack,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeteleted == false
            ? ((context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark),
                        label: const Text('Add to Bookmarks'),
                      ),
                      onTap: () {}),
                  PopupMenuItem(
                    onTap: cancerOrDeleteCallBack,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    ),
                    //onTap: () => _removeOrDeleteTask(context, task),
                  ),
                ])
            : (context) => [
                  PopupMenuItem(
                      onTap: cancerOrDeleteCallBack,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.restore),
                        label: const Text('Restore'),
                      )),
                  PopupMenuItem(
                      onTap: cancerOrDeleteCallBack,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete Forever'),
                      )),
                ]);
  }
}
