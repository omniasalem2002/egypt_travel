import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomGuide extends StatefulWidget {
  const CustomGuide({super.key});

  @override
  State<CustomGuide> createState() => _CustomGuideState();
}

class _CustomGuideState extends State<CustomGuide> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 160,
        height: 180,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 192, 214, 213),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "images/guide.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 122, // Set a fixed height for the image
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: const Text(
                "Guide1",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RatingBar.builder(
                itemSize: 20,
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) {
                  return const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 255, 17, 1),
                  );
                },
                onRatingUpdate: (rating) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
