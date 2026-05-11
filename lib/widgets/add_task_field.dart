import 'package:flutter/material.dart';

class AddTaskField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const AddTaskField({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Digite uma tarefa',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 58,
          height: 58,
          child: ElevatedButton(onPressed: onAdd, child: const Icon(Icons.add)),
        ),
      ],
    );
  }
}
