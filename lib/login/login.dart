import 'package:bodealize/component/clear_button.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.8;
    double textFieldHeight = screenHeight * 0.06;

    Padding textField(double paddingTop, TextEditingController controller) {
      return Padding(
          padding: EdgeInsets.only(top: paddingTop),
          child: Center(
            child: SizedBox(
              width: textFieldWidth,
              height: textFieldHeight,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: ClearButton(controller: controller)
                ),
              ),
            ),
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: const Text('ログイン画面'),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.blueGrey,
            width: 1
          )
        ),
      ),
      body: Column(
        children: [
          textField(100, _emailController),
          textField(50, _passController)
        ],
      ),
    );
  }
}