import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:zoom_course/models/task.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  Database database;
  String databaseName = 'tasks.db';
  static final String taskTableName = 'tasks';
  static final String taskIdColumnName = 'taskId';
  static final String taskNameColumnName = 'taskName';
  static final String taskDescriptionColumnName = 'taskDesc';
  static final String taskIsCompleteColumnName = 'taskIsComplete';
  Future<Database> initDatabase() async {
    if (database == null) {
      return openDataBase();
    } else {
      return database;
    }
  }

  Future<Database> openDataBase() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String dbPath = join(appDocPath, databaseName);
      Database database = await openDatabase(dbPath, version: 1,
          onCreate: (Database db, int version) async {
        await createTasksTable(db);
      });
      return database;
    } on Exception catch (e) {
      print(e);
    }
  }

  createTasksTable(Database db) async {
    db.execute('''CREATE TABLE $taskTableName(
      $taskIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
      $taskNameColumnName TEXT NOT NULL,
      $taskDescriptionColumnName TEXT,
      $taskIsCompleteColumnName INTEGER
    )''');
  }

  Future<int> insertNewTask(Task task) async {
    try {
      database = await initDatabase();
      int rowNumber = await database.insert(taskTableName, task.toMap());
      return rowNumber;
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Task>> getAllTasks() async {
    try {
      database = await initDatabase();
      List<Map<String, dynamic>> response = await database.query(taskTableName);
      List<Task> allTasks = response.map((e) => Task.fromMap(e)).toList();
      return allTasks;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<Task> getSpecificTask(int id) async {}
  deleteTask(Task task) async {}
  updateTask(Task task) async {}
}
