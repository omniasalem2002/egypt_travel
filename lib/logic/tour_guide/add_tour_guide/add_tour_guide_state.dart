
import 'package:guru/data/models/tour_guide/AddTourGuideResponse.dart';

abstract class TourGuideState {}

class TourGuideInitial extends TourGuideState {}

class TourGuideLoading extends TourGuideState {}

class TourGuideSuccess extends TourGuideState {

}

class TourGuideFailure extends TourGuideState {
  final String error;

  TourGuideFailure({required this.error});
}