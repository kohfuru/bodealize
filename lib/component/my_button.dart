import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;
  final double size;
  final double paddingTop;

  const MyButton({
    required this.onPressed,
    required this.text,
    required this.size,
    required this.paddingTop,
    super.key
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double textFieldHeight = screenHeight * 0.06;

    return Padding(
      padding: EdgeInsets.only(top: widget.paddingTop),
      child:  SizedBox(
        width: screenWidth * 0.6,
        height: textFieldHeight,
        child: TextButton(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
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
        )
      ),
    );
  }
}