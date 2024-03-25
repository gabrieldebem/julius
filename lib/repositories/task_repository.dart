import 'package:app/components/database/main.dart';
import 'package:app/entities/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepository {
  final Future<Database> _db = LocalDatabase.getDB();

  Future<List<Task>> findAll() async {
    Database db = await _db;
    List<Map<String, dynamic>> result = await db.query('tasks');
    List<Task> tasks = [];
    for (var task in result) {
      tasks.add(Task(
        id: task['id'],
        title: task['title'],
        description: task['description'],
        isDone: task['isDone'],
      ));
    }
    return tasks;
  }

  Future<Task> create(String title, String description) async {
    Database db = await _db;
    int id = await db.insert('tasks', {
      'title': title,
      'description': description,
      'isDone': false,
    });
    return Task(
      id: id,
      title: title,
      description: description,
      isDone: false,
    );
  }

  Future<void> update(Task task) async {
    Database db = await _db;
    await db.update(
      'tasks',
      {
        'title': task.title,
        'description': task.description,
        'isDone': task.isDone,
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> markAsDone(Task task) async {
    Database db = await _db;
    await db.update(
      'tasks',
      {
        'isDone': true,
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> delete(Task task) async {
    Database db = await _db;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }
}
