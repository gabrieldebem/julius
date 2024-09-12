import 'package:app/controllers/task_card_controller.dart';
import 'package:app/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  TaskCardState createState() => TaskCardState();
}

class TaskCardState extends State<TaskCard> {
  final TaskCardController controller = Get.put(TaskCardController());

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: ListTile(
        textColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(widget.task.title),
        subtitle: Text(widget.task.description),
        trailing: Checkbox(
          value: widget.task.isDone,
          onChanged: (value) {
            widget.task.isDone = value!;
            controller.markTaskAsDone(widget.task);
          },
        ),
      ),
    );
  }
}
