import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_notes_manager/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDarkTheme') ?? false;
  runApp(TaskNotesApp(isDark: isDark));
}

class TaskNotesApp extends StatefulWidget {
  final bool isDark;
  const TaskNotesApp({super.key, required this.isDark});

  @override
  State<TaskNotesApp> createState() => _TaskNotesAppState();
}

class _TaskNotesAppState extends State<TaskNotesApp> {
  late bool isDark;

  @override
  void initState() {
    super.initState();
    isDark = widget.isDark;
  }

  void toggleTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', value);
    setState(() {
      isDark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(onThemeChange: toggleTheme, isDark: isDark),
    );
  }
}

