import 'package:bloc_learning_todo_app/models/task.dart';
import 'package:flutter/material.dart';

import 'blocs/bloc_exports.dart';
import 'screens/tasks_screen.dart';

void main() {
  BlocOverrides.runZoned(() => (const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()..add(AddTask(task: Task(title: "title1"))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
