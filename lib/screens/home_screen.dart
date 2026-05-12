import 'package:animated_task_app/widgets/empty_task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/task_controller.dart';
import '../widgets/add_task_field.dart';
import '../widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final controller = TaskController();
  final controller = Get.put(TaskController());
  final textController = TextEditingController();

  void addTask() {
    if (textController.text.isEmpty) {
      return;
    }

    controller.addTask(textController.text);

    // setState(() {
    //   controller.addTask(textController.text);
    // });

    textController.clear();
  }

  void editTask(int index) {
    final editController = TextEditingController(
      text: controller.tasks[index].titulo,
    );

    showDialog(
      context: context,
      builder: (BuildContext contex) {
        return AlertDialog(
          title: Text(
            'Editar tarefa',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              TextField(
                controller: editController,
                decoration: InputDecoration(
                  hintText: 'Editar tarefa',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepPurple.shade800,
                        ),
                        onPressed: () {
                          // setState(() {});
                          Navigator.pop(context);
                        },
                        child: const Text('cancelar'),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // setState(() {
                          //   controller.editTask(index, editController.text);
                          // });
                          controller.editTask(index, editController.text);
                          Navigator.pop(contex);
                        },
                        child: const Text('Salvar'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            AddTaskField(controller: textController, onAdd: addTask),

            const SizedBox(height: 20),

            // Expanded(
            //   child: controller.tasks.isEmpty
            //       ? const EmptyTasks()
            //       : ListView.builder(
            //           itemCount: controller.tasks.length,

            //           itemBuilder: (context, index) {
            //             final task = controller.tasks[index];

            //             return Dismissible(
            //               key: Key(task.titulo),
            //               background: Container(
            //                 // ESQUERDA -> DIREITO (EDITA)
            //                 margin: const EdgeInsets.only(bottom: 14),
            //                 alignment: Alignment.centerRight,

            //                 padding: const EdgeInsets.only(right: 20),

            //                 decoration: BoxDecoration(
            //                   color: Colors.blue,

            //                   borderRadius: BorderRadius.circular(10),
            //                 ),

            //                 child: const Icon(Icons.edit, color: Colors.white),
            //               ),

            //               // DIREITA -> ESQUERDA (DELETA)
            //               secondaryBackground: Container(
            //                 margin: const EdgeInsets.only(bottom: 14),
            //                 alignment: Alignment.centerRight,
            //                 padding: const EdgeInsets.only(right: 20),
            //                 decoration: BoxDecoration(
            //                   color: Colors.red,
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //                 child: const Icon(
            //                   Icons.delete,
            //                   color: Colors.white,
            //                 ),
            //               ),

            //               confirmDismiss: (direction) async {
            //                 if (direction == DismissDirection.startToEnd) {
            //                   // 👉 EDITAR
            //                   editTask(index);
            //                   return false; // cancela o dismiss
            //                 } else {
            //                   // 👉 DELETAR
            //                   return true; // permite deletar
            //                 }
            //               },

            //               onDismissed: (direction) {
            //                 if (direction == DismissDirection.endToStart) {
            //                   // setState(() {
            //                   //   controller.removeTask(index);
            //                   // });
            //                   controller.removeTask(index);
            //                 }
            //               },

            //               child: TaskCard(
            //                 task: task,

            //                 onToggle: () {
            //                   // setState(() {
            //                   //   controller.toggleTask(index);
            //                   // });
            //                   controller.toggleTask(index);
            //                 },

            //                 onDelete: () {
            //                   // setState(() {
            //                   //   controller.removeTask(index);
            //                   // });
            //                   controller.removeTask(index);
            //                 },

            //                 onEdit: () {
            //                   editTask(index);
            //                 },
            //               ),
            //             );
            //           },
            //         ),
            // ),
            Expanded(
              child: Obx(() {
                return controller.tasks.isEmpty
                    ? const EmptyTasks()
                    : ListView.builder(
                        itemCount: controller.tasks.length,

                        itemBuilder: (context, index) {
                          final task = controller.tasks[index];

                          return Dismissible(
                            key: Key(task.titulo),

                            background: Container(
                              margin: const EdgeInsets.only(bottom: 14),

                              alignment: Alignment.centerRight,

                              padding: const EdgeInsets.only(right: 20),

                              decoration: BoxDecoration(
                                color: Colors.blue,

                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),

                            secondaryBackground: Container(
                              margin: const EdgeInsets.only(bottom: 14),

                              alignment: Alignment.centerRight,

                              padding: const EdgeInsets.only(right: 20),

                              decoration: BoxDecoration(
                                color: Colors.red,

                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),

                            confirmDismiss: (direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                editTask(index);

                                return false;
                              }

                              return true;
                            },

                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                controller.removeTask(index);
                              }
                            },

                            child: TaskCard(
                              task: task,

                              onToggle: () {
                                controller.toggleTask(index);
                              },

                              onDelete: () {
                                controller.removeTask(index);
                              },

                              onEdit: () {
                                editTask(index);
                              },
                            ),
                          );
                        },
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
