import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/task_item.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        priority TEXT,
        description TEXT,
        isCompleted INTEGER
      )
    ''');
  }

  Future<int> insertTask(TaskItem task) async {
    final db = await instance.database;
    final data = task.toJson();
    data.remove('id');
    return await db.insert('tasks', data);
  }

  Future<List<TaskItem>> getTasks() async {
    final db = await instance.database;
    final result = await db.query('tasks');
    return result.map((json) => TaskItem.fromJson(json)).toList();
  }

  Future<int> deleteTask(int id) async {
    final db = await instance.database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateTask(TaskItem task) async {
    final db = await instance.database;
    return db.update(
      'tasks',
      task.toJson(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
