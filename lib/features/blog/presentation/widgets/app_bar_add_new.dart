import 'package:flutter/material.dart';

class AppBarAddNew extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAddNew({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            // uploadBlog();
          },
          icon: const Icon(Icons.done_rounded),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
