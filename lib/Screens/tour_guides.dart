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
      body: LayoutBuilder(
        builder: (context, constraints) {
      // Determine the number of columns based on screen width
      int crossAxisCount = (constraints.maxWidth ~/ 150).toInt();

      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 12, // Change this to the number of items you have
          itemBuilder: (context, index) {
            return const CustomGuide();
          },
        ),
      );
    },
    ),
    );
  }
}
