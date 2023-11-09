import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 325,
          margin: const EdgeInsets.only(left: 10),
          child: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                )
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 4,
              ),
            ),
          ),
        ),
        Container(
          // width: 100,
          margin: const EdgeInsets.only(left: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('button'),
          ),
        )
      ]
    );
  }
}