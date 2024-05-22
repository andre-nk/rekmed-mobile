import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarCustom({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
