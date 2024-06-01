import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:guru/Screens/login_view.dart';
import 'package:guru/core/component/custom_guide.dart';

class TourGuides extends StatefulWidget {
  const TourGuides({super.key});

  @override
  State<TourGuides> createState() => _TourGuidesState();
}

class _TourGuidesState extends State<TourGuides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tour Guides"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 1, 61, 58)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginView();
                    },
                  ),
                );
              },
              child: const Text(
                "Registration of Tour Guide",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomGuide(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
