import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;

  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TaskCard({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(10),

        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
            offset: Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [
          AnimatedScale(
            duration: const Duration(milliseconds: 200),

            scale: task.isDone ? 1.2 : 1,

            child: Checkbox(
              activeColor: Colors.deepPurple.shade800,
              value: task.isDone,
              onChanged: (_) => onToggle(),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),

              style: TextStyle(
                fontSize: 15,
                color: task.isDone ? Colors.grey : Colors.black87,
                fontWeight: task.isDone ? FontWeight.normal : FontWeight.bold,
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),

              child: Text(task.titulo),
            ),
          ),

          IconButton(
            onPressed: onEdit,

            icon: const Icon(Icons.edit, color: Colors.deepPurple),
          ),

          IconButton(
            onPressed: onDelete,

            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
