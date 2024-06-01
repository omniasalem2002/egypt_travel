import 'package:flutter/material.dart';
import 'package:guru/Screens/tour_guides.dart';
import 'package:guru/onboarding_screen.dart';
import 'package:guru/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour Guide Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: _checkOnboardingComplete(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Splash(); // Show splash screen while checking
          } else if (snapshot.hasData && snapshot.data == true) {
            return TourGuides();
          } else {
            return OnboardingScreen();
          }
        },
      ),
    );
  }

  Future<bool> _checkOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(
        Duration(seconds: 2)); // Simulate a splash screen delay
    return prefs.getBool('onboardingComplete') ?? false;
  }
}
