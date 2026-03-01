import 'package:flutter/material.dart';
import '../models/task.dart';
import 'date_picker_field.dart';

class AddTaskDialog extends StatefulWidget {
  final Function(Task) onAdd;

  const AddTaskDialog({super.key, required this.onAdd});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController controller = TextEditingController();
  DateTime? selectedDate;

  void submit() {
    if (controller.text.isEmpty || selectedDate == null) return;

    widget.onAdd(Task(title: controller.text, date: selectedDate!));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Thêm công việc"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: "Tên công việc"),
          ),
          const SizedBox(height: 10),
          DatePickerField(
            onSelected: (date) => selectedDate = date,
          )
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Hủy")),
        ElevatedButton(onPressed: submit, child: const Text("OK")),
      ],
    );
  }
}