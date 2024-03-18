import 'package:app/components/task_card.dart';
import 'package:app/controllers/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TaskController _controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Objetivos do dia:",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: _getTasks(),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(26.0))),
        onPressed: _createTask,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _createTask() {
    print("Create task");
  }

  List<Widget> _getTasks() {
    return _controller.findAll().map((task) {
      return TaskCard(
        task: task,
      );
    }).toList();
  }
}
