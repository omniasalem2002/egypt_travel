import 'package:flutter/material.dart';
import 'package:guru/Screens/tour_guides.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('onboardingComplete', true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TourGuides()),
            );
          },
          child: Text('Finish Onboarding'),
        ),
      ),
    );
  }
}
