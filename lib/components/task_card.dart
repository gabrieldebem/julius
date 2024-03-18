import 'package:app/entities/task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  TaskCardState createState() => TaskCardState();
}

class TaskCardState extends State<TaskCard> {
  bool isDone = false;
  
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
          onChanged: (value) => isDone = !isDone,
        ),
      ),
    );
  }

}
