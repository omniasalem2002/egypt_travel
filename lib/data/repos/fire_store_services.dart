import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guru/data/models/tour_guide/TourGuideModel.dart';

class FireStoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'tour_guides'; // Name of the Firestore collection

  Future<void> addTourGuide(TourGuideRequestBody tourGuide) async {
    try {
      await _firestore.collection(_collectionName).add(tourGuide.toJson());
    } catch (e) {
      throw Exception('Failed to add tour guide: $e');
    }
  }

// Add more methods for updating, deleting, and fetching tour guides as needed
}
