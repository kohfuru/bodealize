import 'package:flutter/material.dart';

class ModalTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

   const ModalTextField({
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
          onPressed: () {},
          icon: const Icon(Icons.list)
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