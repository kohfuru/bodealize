import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PfcPage extends StatelessWidget {
  const PfcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text('PFC'),
        onPressed: () => print('object'),
    );
  }
}