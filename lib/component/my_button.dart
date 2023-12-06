import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;
  final double size;

  const MyButton({
    required this.onPressed,
    required this.text,
    required this.size,
    super.key
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
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