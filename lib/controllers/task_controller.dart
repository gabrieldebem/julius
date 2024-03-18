import 'package:app/entities/task.dart';
import 'package:app/repositories/task_repository.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  List<Task> findAll() {
    return TaskRepository().findAll();
  }

  void deleteTask(String id) {
    TaskRepository().delete(id);
  }
}
