import 'package:app/entities/task.dart';
import 'package:app/repositories/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final TaskRepository _repository = TaskRepository();
  final RxList<Task> tasks = <Task>[].obs;

  final _formKey = GlobalKey<FormState>();
  final _title = ''.obs;
  final _description = ''.obs;

  GlobalKey<FormState> get formKey => _formKey;
  String get title => _title.value;
  String get description => _description.value;

  set title(String value) => _title.value = value;
  set description(String value) => _description.value = value;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void onTitleChanged(String value) => title = value;
  void onDescriptionChanged(String value) => description = value;

  @override
  void onInit() {
    titleController.addListener(() => onTitleChanged(titleController.text));
    descriptionController
        .addListener(() => onDescriptionChanged(descriptionController.text));

    super.onInit();
    findAll();
  }

  Future<void> onRefresh() async {
    await findAll();
  }

  Future<void> findAll() async {
    List<Task> result = await _repository.findAll();

    tasks.clear();
    tasks.addAll(result);
  }

  Future<void> create(String title, String description) async {
    Task task = await _repository.create(title, description);

    tasks.add(task);
  }

  Future<void> markTaskAsDone(Task task) async {
    task.isDone = true;

    await _repository.markAsDone(task);
    List<Task> result = await _repository.findAll();

    tasks.clear();
    tasks.addAll(result);
  }

  Future<void> submitCreateForm() async {
    if (_formKey.currentState!.validate()) {
      await create(title, description);
      titleController.clear();
      descriptionController.clear();
      Get.back();
    }
  }
}
