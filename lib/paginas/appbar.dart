import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? 'Ops'),
      leading: Builder(builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + 20); // Altura do AppBar
}
