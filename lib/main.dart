import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guru/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    try {
      await Firebase.initializeApp();
      print('Firebase initialized successfully');
    } catch (e) {
      print('Firebase initialization error: $e');
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
