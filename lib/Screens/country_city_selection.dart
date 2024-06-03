import 'package:flutter/material.dart';
import 'package:guru/Screens/tour_guides.dart';
import 'package:guru/core/utils/colors_app.dart';
import 'package:guru/core/utils/custom_text_button.dart';
import 'package:guru/core/utils/styles.dart';
class CountryCitySelection extends StatefulWidget {
  const CountryCitySelection({super.key});

  @override
  State<CountryCitySelection> createState() => _CountryCitySelectionState();
}

class _CountryCitySelectionState extends State<CountryCitySelection> {
  String? _selectedCountry;
  String? _selectedCity;

  final List<String> _countries = ['Egypt'];
  final List<String> _cities = [
    'Cairo',
    'Luxor',
    'Aswan',
    'Alexandria',
    'Sharm El Sheikh',
    'Hurghada',
    'Dahab',
    'Siwa Oasis',
    'Marsa Alam',
    'Port Said',
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Country and City"),
          centerTitle: true,
        ),
        body: Form(
          //key: ,
          child: Center(
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.start,
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: DropdownButtonFormField<String>(
                    value: _selectedCountry,
                    decoration: InputDecoration(
                      fillColor: ColorsApp.darkPrimary,
                      labelText: 'Select country you want to visit',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorsApp.darkPrimary,
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    items: _countries.map((String type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCountry = value;
                      });
                    },
                  ),
                ),
               const SizedBox(height: 25,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: DropdownButtonFormField<String>(

                    value: _selectedCity,
                    decoration: InputDecoration(
                      fillColor: ColorsApp.darkPrimary,
                      labelText: 'Select city you want to visit',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorsApp.darkPrimary,
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    items: _cities.map((String type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value;
                      });
                    },
                  ),
                ),
              const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: AppTextButton(
                    buttonText: 'Tour Guides',
                    textStyle:
                    Styles.font14LightGreyRegular(context),
                    backgroundColor: ColorsApp.darkPrimary,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const TourGuides();
                          },
                        ),
                      );

                      //validateThenDoAddDepartment(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
