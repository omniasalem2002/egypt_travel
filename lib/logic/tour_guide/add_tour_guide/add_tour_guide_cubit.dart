import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guru/data/models/tour_guide/TourGuideModel.dart';
import 'package:guru/data/repos/fire_store_services.dart';
import 'package:guru/logic/tour_guide/add_tour_guide/add_tour_guide_state.dart';

class TourGuideCubit extends Cubit<TourGuideState> {
  final FireStoreServices _fireStoreService;

  TourGuideCubit(this._fireStoreService) :super(TourGuideInitial());

  TextEditingController tourGuideNameController = TextEditingController();
  TextEditingController tourGuidePhoneNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController selectedPaymentController = TextEditingController();
  TextEditingController selectedCityController = TextEditingController();
  File? image ;
  TextEditingController emailController = TextEditingController();
  TextEditingController personalWebsiteController = TextEditingController();
  TextEditingController professionalSummaryController = TextEditingController();
  TextEditingController workExperiencesController = TextEditingController();



  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addTourGuide() async {
    emit(TourGuideLoading());

   try{
     String? imageurl =await _uploadImage(image);

     final response = await _fireStoreService.addTourGuide(TourGuideRequestBody(name:
     tourGuideNameController.text,
         phoneNumber: tourGuidePhoneNumberController.text, birthDate: birthDateController.text
         , selectedPayment: selectedPaymentController.text
         , selectedCity: selectedCityController.text, image: imageurl!,
         email: emailController.text, personalWebsite:
         personalWebsiteController.text, professionalSummary: professionalSummaryController.text,
         workExperiences: workExperiencesController.text)
     );
     emit(TourGuideSuccess());
         }
      catch(e) {
        emit(TourGuideFailure(error: e.toString()));
      }}

  Future<String?> _uploadImage(File? image) async {
    if (image == null) {
      print('No image selected.');
      return null;
    }

    String fileName = path.basename(image.path);
    Reference storageReference =
    FirebaseStorage.instance.ref().child('images/$fileName');
    UploadTask uploadTask = storageReference.putFile(image);

    try {
      await uploadTask;
      print('Image uploaded to Firebase Storage');

      // Return the download URL of the uploaded image
      String downloadURL = await storageReference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Upload failed: $e');
      return null;
    }
  }}
