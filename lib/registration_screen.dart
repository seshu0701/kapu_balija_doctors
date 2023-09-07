import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'services/helper.dart';
import 'utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController homeAddressController = TextEditingController();
  final TextEditingController clinicAddressController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController educationQualificationController =
      TextEditingController();
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController treatedDiseasesController =
      TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          iconTheme: IconThemeData(
              color: isDarkMode(context) ? Colors.white : Colors.black),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Register"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          key: _registerKey,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: firstNameController,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'First Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    )),
                validator: (value) => !value!.contains('@')
                    ? 'Please enter valid First Name'
                    : null,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: middleNameController,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'Middle Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: lastNameController,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'Last Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    )),
                validator: (value) => !value!.contains('@')
                    ? 'Please enter valid Last Name'
                    : null,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: homeAddressController,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: 'Home Address',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.black,
                    )),
                validator: (value) =>
                    !value!.contains('@') ? 'Please enter Home Address' : null,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: clinicAddressController,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: 'Clinic Address',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Colors.black,
                    )),
                validator: (value) => !value!.contains('@')
                    ? 'Please enter Clinic Address'
                    : null,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: emailController,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Email Address',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    )),
                validator: (value) =>
                    !value!.contains('@') ? 'Please enter valid email' : null,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: passwordController,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    )),
                validator: (value) =>
                    value!.length < 6 ? 'Must be at least 6 characters' : null,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: contactNoController,
                //cursorColor: Colors.white,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: 'Contact No',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.black,
                    )),
                validator: (value) => !value!.contains('@')
                    ? 'Please enter valid contact no'
                    : null,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: educationQualificationController,
                //cursorColor: Colors.white,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: 'Education Qualification',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.cast_for_education,
                      color: Colors.black,
                    )),
                validator: (value) => !value!.contains('@')
                    ? 'Please enter Education Qualification'
                    : null,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: specialityController,
                //cursorColor: Colors.white,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'Speciality',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.cast_for_education,
                      color: Colors.black,
                    )),
                validator: (value) =>
                    !value!.contains('@') ? 'Please enter Speciality' : null,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                controller: treatedDiseasesController,
                //cursorColor: Colors.white,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'Mostly Treated Diseases',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.health_and_safety,
                      color: Colors.black,
                    )),
                validator: (value) =>
                    !value!.contains('@') ? 'Please enter valid email' : null,
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        //elevation: 1,
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.only(top: 12, bottom: 12)),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      if (_registerKey.currentState!.validate()) {
                        submitDetails();
                      }
                    },
                    child: const Text('Submit'))),
            const SizedBox(
              height: 16,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.black,
                  ))
                : const SizedBox()
          ],
        ));
  }

  void submitDetails() async {
    try {
      final uri = Uri.parse("${baseUrl}api/users/register");
      Response response = await post(
          Uri.parse('http://62.72.31.8:8888/api/users/register'),
          body: {
            'firstName': firstNameController.text,
            'middleName': middleNameController.text,
            'lastName': lastNameController.text,
            'password': passwordController.text,
            'email': emailController.text,
            'phone': contactNoController.text,
            'roleId': "1",
            'education': educationQualificationController.text,
            'speciality': specialityController.text,
            'treatedDiseases': treatedDiseasesController.text,
            'address': homeAddressController.text,
            'clinicAddress': clinicAddressController.text
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        //print(data['token']);
        print(data);
        print('Register successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
