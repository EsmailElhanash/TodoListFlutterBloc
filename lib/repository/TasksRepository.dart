import 'package:sqflite/sqflite.dart';

import '../../models/task.dart';

class TasksRepository {
  final Database database;

  TasksRepository(this.database);

  Future<List<Task>> getTasks() async {
    final List<Map<String, dynamic>> taskMaps = await database.query('tasks');
    return List.generate(taskMaps.length, (i) {
      return Task(
        id: taskMaps[i]['id'],
        description: taskMaps[i]['description'],
        isCompleted: taskMaps[i]['isCompleted'] == 1,
      );
    });
  }

  Future<void> addTask(Task task) async {
    await database.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTask(Task task) async {
    await database.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int taskId) async {
    await database.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [taskId],
    );
  }
}
