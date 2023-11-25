// import 'package:bodealize/footer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:bodealize/home.dart';
import 'package:bodealize/login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  bool checkLogin() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = checkLogin();
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bodealize',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: isLogin ? const HomePage() : const Login(),
    );
  }
}