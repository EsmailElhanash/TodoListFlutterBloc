import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../data_provider/database_provider.dart';
import '../models/task.dart';

class TasksCubit extends Cubit<List<Task>> {
  final LocalDatabaseProvider _databaseProvider =
      LocalDatabaseProvider.instance;

  TasksCubit() : super([]) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    final Database db = await _databaseProvider.database;
    final List<Map<String, dynamic>> maps =
        await db.query('tasks', where: 'isCompleted = ?', whereArgs: [0]);

    final tasks = List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        description: maps[i]['description'],
        isCompleted: maps[i]['isCompleted'] == 1,
      );
    });

    emit(tasks);
  }

  Future<void> addTask(Task newTask) async {
    final Database db = await _databaseProvider.database;
    await db.insert(
      'tasks',
      newTask.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    loadTasks();
  }

  Future<void> editTask(int id, Task updatedTask) async {
    final Database db = await _databaseProvider.database;
    await db.update(
      'tasks',
      updatedTask.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
    loadTasks();
  }

  Future<void> deleteTask(int id) async {
    final Database db = await _databaseProvider.database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
    loadTasks();
  }
}
