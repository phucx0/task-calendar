import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onAdd;

  const CustomAppBar({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Task Calendar"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: onAdd,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}