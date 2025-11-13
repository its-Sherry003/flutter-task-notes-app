import 'package:flutter/material.dart';
import 'package:task_notes_manager/screens/home.dart';

void main() {
  runApp(const TaskNotes());
}

class TaskNotes extends StatelessWidget {
  const TaskNotes({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Notes Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
