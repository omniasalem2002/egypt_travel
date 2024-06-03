import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guru/core/component/custom_text_form_field.dart';
import 'package:guru/core/utils/colors_app.dart';
import 'package:guru/core/utils/custom_text_button.dart';
import 'package:guru/core/utils/styles.dart';
import 'package:image_picker/image_picker.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? _selectedUserType;
  final _birthdateController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedPaymentType;
  File? _image;
  final List<String> _paymentTypes = ['Credit Card', 'PayPal', 'Bank Transfer'];

  final ImagePicker _picker = ImagePicker();
  // Function to handle image selection
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        _birthdateController.text = '${pickedDate.toLocal()}'.split(' ')[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Registration"),
            centerTitle: true,
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Card(
                        color: const Color.fromARGB(255, 5, 179, 170),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                        child: Container(
                            alignment: Alignment.center,
                            width: 160,
                            height: 160,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                //color: Colors.grey[200],

                                borderRadius: BorderRadius.circular(70)),
                            child: Image.asset(
                              "images/logo_remove.png",
                              height: 120,
                              width: 120,
                              // fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 1, 61, 58)),
                          onPressed: () {
                            setState(() {
                              _selectedUserType = 'Tour Guide';
                            });
                          },
                          child: const Text(
                            "Tour Guide",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 1, 61, 58)),
                          onPressed: () {
                            setState(() {
                              _selectedUserType = " Tourist  ";
                            });
                          },
                          child: const Text(
                            " Tourist  ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        // ElevatedButton.icon(
                        //   onPressed: () {
                        //     setState(() {
                        //       _selectedUserType = 'Tourist';
                        //     });
                        //   },
                        //   icon: const Icon(
                        //     Icons.person,
                        //     color: ColorsApp.primaryColor,
                        //   ),
                        //   label: const Text(
                        //     'Tourist',
                        //     style: TextStyle(color: ColorsApp.primaryColor),
                        //   ),
                        // ),
                      ],
                    ),
                    if (_selectedUserType == 'Tour Guide' ||
                        _selectedUserType == null)
                      Form(
                        //formKey
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Container(
                              width: double
                                  .infinity, // This makes the container take up the full width
                              child: Align(
                                alignment: Alignment
                                    .centerLeft, // Align the text to the start of the container
                                child: Text(
                                  "Register As Tour Guide",
                                  style: Styles.font18LightGreyBold(context),
                                  textAlign: TextAlign
                                      .left, // Align text inside the Text widget to the left
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter Your Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                if (value.length < 3) {
                                  return 'Name must be at least 3 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter Your Phone Number",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                if (value.length != 10) {
                                  // Adjust length as per your requirement
                                  return 'Phone number must be exactly 10 digits';
                                }
                                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return 'Phone number must contain only digits';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Birthdate',
                                fillColor: ColorsApp.primaryColor,
                              ),
                              controller: _birthdateController,
                              onTap: _presentDatePicker,
                              readOnly: true,
                            ),
                            const SizedBox(height: 20),
                            DropdownButtonFormField<String>(
                              value: _selectedPaymentType,
                              decoration: InputDecoration(
                                fillColor: ColorsApp.darkPrimary,
                                labelText: 'Select Payment Type',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: ColorsApp.darkPrimary,
                                    width: 1.3,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              items: _paymentTypes.map((String type) {
                                return DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedPaymentType = value;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            _image != null
                                ? Image.file(_image!)
                                : Text('No image selected.',
                                    style: TextStyle(color: Colors.red)),
                            ElevatedButton.icon(
                              icon: const Icon(
                                Icons.upload_file,
                                color: ColorsApp.semiPrimaryColor,
                              ),
                              label: const Text(
                                'Upload Photo',
                                style: TextStyle(
                                    color: ColorsApp.semiPrimaryColor),
                              ),
                              onPressed: _pickImage,
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter Your Email",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter Your City",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your city';
                                }
                                if (value.length < 3) {
                                  return 'City must be at least 3 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter Your Personal Website",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your personal website';
                                }
                                // Simple URL validation
                                final urlPattern =
                                    r'^(http[s]?:\/\/)?([^\s(["<,>]*\.)*[^\s[",><]*\.[^\s[",><]*$';
                                final urlRegExp = RegExp(urlPattern);
                                if (!urlRegExp.hasMatch(value)) {
                                  return 'Please enter a valid URL';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter Your Professional Summary",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your professional summary';
                                }
                                return null;
                              },
                              maxLines: 5,
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter Your Work Experience",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your work experience';
                                }
                                return null;
                              },
                              maxLines: 5,
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: AppTextButton(
                                buttonText: 'Create',
                                textStyle:
                                    Styles.font14LightGreyRegular(context),
                                backgroundColor: ColorsApp.darkPrimary,
                                onPressed: () {
                                  //validateThenDoAddDepartment(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (_selectedUserType == " Tourist  ")
                      Form(
                        //formKey
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Container(
                              width: double
                                  .infinity, // This makes the container take up the full width
                              child: Align(
                                alignment: Alignment
                                    .centerLeft, // Align the text to the start of the container
                                child: Text(
                                  "Register As Tourist",
                                  style: Styles.font18LightGreyBold(context),
                                  textAlign: TextAlign
                                      .left, // Align text inside the Text widget to the left
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter Your Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                if (value.length < 3) {
                                  return 'Name must be at least 3 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter Your Phone Number",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                if (value.length != 10) {
                                  // Adjust length as per your requirement
                                  return 'Phone number must be exactly 10 digits';
                                }
                                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return 'Phone number must contain only digits';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter your Country",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Country';
                                }
                                if (value.length < 3) {
                                  return 'Country must be at least 3 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              hintText: "Enter Places Want To Visit In Egypt",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Places Want To Visit In Egypt';
                                }
                                if (value.length < 3) {
                                  return 'Places must be at least 3 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: AppTextButton(
                                buttonText: 'Create',
                                textStyle:
                                    Styles.font14LightGreyRegular(context),
                                backgroundColor: ColorsApp.darkPrimary,
                                onPressed: () {
                                  //validateThenDoAddDepartment(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
