import 'package:app/entities/task.dart';
import 'package:app/repositories/task_repository.dart';
import 'package:get/get.dart';

class TaskCardController extends GetxController {
  final TaskRepository taskRepository = Get.put(TaskRepository());

  void markTaskAsDone(Task task) {
    taskRepository.markAsDone(task);
  }
}
