import 'package:flutter/material.dart';

SizedBox buttonBarContent(onPressed, backColor, text) {
  return SizedBox(
    width: 100,
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: backColor
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}