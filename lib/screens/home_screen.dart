import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/task_controller.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/add_task_dialog.dart';
import '../models/task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AddTaskDialog(
        onAdd: (Task task) =>
            context.read<TaskController>().addTask(task),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskController(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: CustomAppBar(onAdd: () => openDialog(context)),
          body: Consumer<TaskController>(
            builder: (_, controller, __) {
              if (controller.tasks.isEmpty) {
                return const Center(child: Text("Chưa có công việc"));
              }

              return ListView.builder(
                itemCount: controller.tasks.length,
                itemBuilder: (_, i) {
                  final task = controller.tasks[i];
                  return ListTile(
                    title: Text(task.title),
                    subtitle: Text(
                        "${task.date.day}/${task.date.month}/${task.date.year} - ${task.date.hour}:${task.date.minute}"),
                  );
                },
              );
            },
          ),
        );
      }),
    );
  }
}