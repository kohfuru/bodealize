import 'package:flutter/material.dart';

class ModalTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onPressed;
  final IconData icon;

   const ModalTextField({
     required this.onPressed,
     required this.icon,
     required this.controller,
     required this.hintText,
     Key? key,
   }) : super(key: key);

  @override
  State<ModalTextField> createState() => _ModalTextFieldState();
}

class _ModalTextFieldState extends State<ModalTextField> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            widget.icon,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: TextField(
            controller: widget.controller,
            style: const TextStyle(
              fontSize: 20
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              suffixIcon: IconButton(
                onPressed: () => widget.controller.clear(),
                icon: const Icon(Icons.clear),
              )
            ),
          )
        ),
      ],
    );
  }
}