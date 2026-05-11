import 'package:animated_task_app/models/task_model.dart';

class TaskController {
  final List<TaskModel> tasks = [];

  // ADICIONANDO TAREFA
  void addTask(String titulo) {
    tasks.add(TaskModel(titulo: titulo));
  }

  // REMOVE TAREFA
  void removeTask(int index) {
    tasks.removeAt(index);
  }

  // ALTERNAR TAREFA
  void toggleTask(int index) {
    tasks[index].isDone = !tasks[index].isDone;
  }

  // EDITAR TAREFA
  void editTask(int index, String newTitulo) {
    tasks[index].titulo = newTitulo;
  }
}
