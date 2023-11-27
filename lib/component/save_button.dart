import 'package:flutter/material.dart';

class SaveButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;
  final double size;

  const SaveButton({
    required this.onPressed,
    required this.text,
    required this.size,
    super.key
  });

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        fixedSize: const Size(120, 60),
        backgroundColor: Colors.orange
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: widget.size,
        ),
      ) ,
    );
  }
}