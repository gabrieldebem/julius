import 'package:app/entities/task.dart';
import 'package:localstorage/localstorage.dart';

LocalStorage storage = LocalStorage("tasks");

class TaskRepository {
  List<Task> findAll() {
    List<Task> tasks = [];

    storage.getItem("tasks")?.forEach((key, value) {
      tasks.add(value);
    });
    return tasks;
  }

  void create(Task task) {
    storage.setItem(task.title, task);
  }

  void delete(String title) {
    storage.deleteItem(title);
  }
}
