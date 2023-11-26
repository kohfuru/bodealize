import 'package:flutter/material.dart';

class ClearButton extends StatefulWidget {
  final TextEditingController controller;

  const ClearButton({
    required this.controller,
    super.key
  });

  @override
  State<ClearButton> createState() => _ClearButtonState();
}

class _ClearButtonState extends State<ClearButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => widget.controller.clear(),
      icon: const Icon(Icons.clear),
    );
  }
}