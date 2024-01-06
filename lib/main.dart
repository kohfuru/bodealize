import 'package:bodealize/modal/save_date.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.dart';
import 'login/login_ui.dart';
import 'firestore_reference.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await saveDate(DateTime.now());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirestoreReference firestoreReference = FirestoreReference();
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bodealize',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: firestoreReference.auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          if (snapshot.hasData) {
            return const HomePage();
          }
          return const Login();
        },
      ),
    );
  }
}