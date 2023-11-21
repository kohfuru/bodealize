import 'package:flutter/material.dart';
import 'menu_list_body.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: const Text('メニューリスト'),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.blueGrey,
            width: 1
          )
        ),
      ),
      body: MenuListBody(),
    );
  }
}