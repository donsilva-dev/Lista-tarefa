// import 'package:animated_task_app/models/task_model.dart';

// class TaskController {
//   final List<TaskModel> tasks = [];

//   // ADICIONANDO TAREFA
//   void addTask(String titulo) {
//     tasks.add(TaskModel(titulo: titulo));
//   }

//   // REMOVE TAREFA
//   void removeTask(int index) {
//     tasks.removeAt(index);
//   }

//   // ALTERNAR TAREFA
//   void toggleTask(int index) {
//     tasks[index].isDone = !tasks[index].isDone;
//   }

//   // EDITAR TAREFA
//   void editTask(int index, String newTitulo) {
//     tasks[index].titulo = newTitulo;
//   }
// }

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/task_model.dart';

class TaskController extends GetxController {
  final Box box = Hive.box('tasksBox');

  RxList<TaskModel> tasks = <TaskModel>[].obs;

  TaskController() {
    loadTasks();
  }

  // void loadTasks() {
  //   final List savedTasks = box.get('tasks', defaultValue: []);

  //   tasks = savedTasks
  //       .map((task) => TaskModel(titulo: task['title'], isDone: task['isDone']))
  //       .toList()

  // }

  void loadTasks() {
    final List savedTasks = box.get('tasks', defaultValue: []);

    tasks.value = savedTasks.map((task) {
      return TaskModel(titulo: task['title'], isDone: task['isDone']);
    }).toList();
  }

  void saveTasks() {
    final List formattedTasks = tasks.map((task) {
      return {'title': task.titulo, 'isDone': task.isDone};
    }).toList();

    box.put('tasks', formattedTasks);
  }

  void addTask(String title) {
    tasks.add(TaskModel(titulo: title));

    saveTasks();
  }

  void removeTask(int index) {
    tasks.removeAt(index);

    saveTasks();
  }

  void toggleTask(int index) {
    tasks[index].isDone = !tasks[index].isDone;

    tasks.refresh();
    saveTasks();
  }

  void editTask(int index, String newTitle) {
    tasks[index].titulo = newTitle;

    tasks.refresh();
    saveTasks();
  }
}
