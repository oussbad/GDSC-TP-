import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/online/auth/SignIn.dart';
import 'package:gdsc/online/auth/SignUp.dart';
import 'firebase_options.dart';
import 'offline/auth/LoginPage.dart';

// Error multidex
// publish the data from firebase

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange
      ),
      home: SignIn()

    );
  }
}