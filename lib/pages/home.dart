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
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
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
                  Column(children: _getTasks()),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(26.0))),
          onPressed: () {
            Get.dialog(
              AlertDialog(
                title: const Text('Nova tarefa'),
                content: Form(
                  key: _controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _controller.titleController,
                        onChanged: _controller.onTitleChanged,
                        decoration: const InputDecoration(labelText: 'Título'),
                      ),
                      TextField(
                        controller: _controller.descriptionController,
                        onChanged: _controller.onDescriptionChanged,
                        decoration:
                            const InputDecoration(labelText: 'Descrição'),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller.submitCreateForm();
                      Get.back();
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            );
          },
          tooltip: 'Adicionar nova tarefa',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  List<Widget> _getTasks() {
    return _controller.tasks.map((element) {
      return TaskCard(task: element);
    }).toList();
  }
}
