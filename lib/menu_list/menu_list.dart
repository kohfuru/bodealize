import 'package:bodealize/component/appbar.dart';
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
    return const Scaffold(
      appBar: AppBarWidget(
        title: 'メニューリスト',
        actions: [],
      ),
      body: MenuListBody(),
    );
  }
}