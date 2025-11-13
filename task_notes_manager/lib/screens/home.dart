import 'package:flutter/material.dart';
import 'package:task_notes_manager/screens/add_task.dart';
import 'package:task_notes_manager/models/task_item.dart';
import 'package:task_notes_manager/database/database_helper.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool) onThemeChange;
  final bool isDark;

  const HomeScreen({
    super.key,
    required this.onThemeChange,
    required this.isDark,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskItem> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final db = DatabaseHelper.instance;
    final loadedTasks = await db.getTasks();
    setState(() => tasks = loadedTasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Tasks & Notes")),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text("Theme"),
            value: widget.isDark,
            onChanged: widget.onThemeChange,
          ),
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: Text("No tasks yet"))
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return ListTile(
                        title: Text(task.title),
                        subtitle: Text(task.description),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await DatabaseHelper.instance.deleteTask(task.id!);
                            _loadTasks();
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
          _loadTasks(); // refresh when returning
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
