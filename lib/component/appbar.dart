import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool backButton;
  final Widget leading;

  const AppBarWidget({
    required this.title,
    required this.actions,
    required this.backButton,
    required this.leading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade50,
      automaticallyImplyLeading: backButton,
      leading: leading,
      title: Text(title),
      shape: const Border(
        bottom: BorderSide(
          color: Colors.blueGrey,
          width: 1,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}