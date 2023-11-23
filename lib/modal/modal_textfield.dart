import 'package:flutter/material.dart';

class ModalTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onPressed;
  final IconData icon;
  final bool autofocus;
  final double height;
  final double padding;

   const ModalTextField({
     required this.onPressed,
     required this.icon,
     required this.controller,
     required this.hintText,
     required this.autofocus,
     required this.height,
     required this.padding,
     super.key,
   });

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
          child: SizedBox(
            height: widget.height,
            child: TextField(
              maxLines: null,
              autofocus: widget.autofocus,
              controller: widget.controller,
              style: const TextStyle(
                // height: 10,
                  fontSize: 20
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: widget.padding),
                      child: IconButton(
                        onPressed: () => widget.controller.clear(),
                        icon: const Icon(Icons.clear),
                      )
                  )
              ),
            ),
          )
        ),
      ],
    );
  }
}