import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kapu_balija_doctors/login_screen.dart';
import 'package:kapu_balija_doctors/models/user_profile.dart';
import 'package:kapu_balija_doctors/utils/api_service.dart';
import 'package:kapu_balija_doctors/utils/images.dart';
import 'package:kapu_balija_doctors/utils/utils.dart';

import 'services/helper.dart';
import 'utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final TextEditingController firstNameController =
      TextEditingController(text: "Seshu");
  final TextEditingController lastNameController =
      TextEditingController(text: "Saragadam");
  final TextEditingController passwordController =
      TextEditingController(text: "Vidhita@0701");
  final TextEditingController emailController =
      TextEditingController(text: "s.seshu143@gmail.com");
  final TextEditingController homeAddressController =
      TextEditingController(text: "Manikonda");
  final TextEditingController cityAddressController =
      TextEditingController(text: "Hyderabad");
  final TextEditingController contactNoController =
      TextEditingController(text: "8686378737");
  final TextEditingController specializationController =
      TextEditingController(text: "Cardialogy");
  final TextEditingController hospitalNameController =
      TextEditingController(text: "Apollo");
  final TextEditingController confirmPasswordController =
      TextEditingController(text: "Vidhita@0701");
  final TextEditingController dateOfBirthController =
      TextEditingController(text: "1987-08-11");
  bool isLoading = false;
  String selectState = 'Select State';
  String selectGender = 'Select Gender';

  // List of items in our dropdown menu
  var dropDownItems = [
    const DropdownMenuItem(
        value: "Andhra Pradesh", child: Text("Andhra Pradesh")),
    const DropdownMenuItem(value: "Telangana", child: Text("Telangana")),
  ];
  List genderList = ["Male", "Female"];

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    confirmPasswordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
            color: Colors.black,
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                ),
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24, top: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              getRequiredLabel(firstName),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: firstNameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: borderBg,
                                    hintText: firstName,
                                    hintStyle:
                                        const TextStyle(color: hintColor),
                                    prefixIcon: Image.asset(nameIcon),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        5.0, 10.0, 5.0, 10.0),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              getRequiredLabel(lastName),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: lastNameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: borderBg,
                                    hintText: lastName,
                                    hintStyle:
                                        const TextStyle(color: hintColor),
                                    prefixIcon: Image.asset(nameIcon),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        5.0, 10.0, 5.0, 10.0),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              getRequiredLabel(gender),
                              RadioListTile(
                                title: const Text('Male'),
                                // Display the title for option 1
                                value: "male",
                                // Assign a value of 1 to this option
                                groupValue: selectGender,
                                // Use _selectedValue to track the selected option
                                onChanged: (value) {
                                  setState(() {
                                    selectGender =
                                        value!; // Update _selectedValue when option 1 is selected
                                  });
                                },
                              ),
                              // Create a RadioListTile for option 2
                              RadioListTile(
                                title: const Text('Female'),
                                // Display the title for option 2
                                value: "female",
                                // Assign a value of 2 to this option
                                groupValue: selectGender,
                                // Use _selectedValue to track the selected option
                                onChanged: (value) {
                                  setState(() {
                                    selectGender =
                                        value!; // Update _selectedValue when option 2 is selected
                                  });
                                },
                              ),
                              const SizedBox(height: 5),
                              isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ))
                                  : const SizedBox(),
                              getDateOfBirthLabel(dateOfBirth),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                child: TextField(
                                  controller: dateOfBirthController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: borderBg,
                                    hintText: dateOfBirth,
                                    hintStyle:
                                        const TextStyle(color: hintColor),
                                    suffixIcon: Image.asset(calendarIcon),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 10.0, 10.0),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                  readOnly: true,
                                  onTap: _dateOfBirthPicker,
                                ),
                              ),
                              const SizedBox(height: 5),
                              getRequiredLabel(emailId),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: borderBg,
                                    hintText: enterYourEmail,
                                    hintStyle:
                                        const TextStyle(color: hintColor),
                                    prefixIcon: Image.asset(emailIcon),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        5.0, 10.0, 5.0, 10.0),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              getHeaderLabelText(contactNumber),
                              const SizedBox(height: 5),
                              SizedBox(
                                child: TextFormField(
                                  controller: contactNoController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: borderBg,
                                    hintText: contactNumber,
                                    hintStyle:
                                        const TextStyle(color: hintColor),
                                    prefixIcon: Image.asset(nameIcon),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        5.0, 10.0, 5.0, 10.0),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ),
                              getRequiredLabel(address),
                              const SizedBox(height: 5),
                              SizedBox(
                                child: TextFormField(
                                  controller: homeAddressController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: borderBg,
                                    hintText: address,
                                    hintStyle:
                                        const TextStyle(color: hintColor),
                                    prefixIcon: Image.asset(nameIcon),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        5.0, 10.0, 5.0, 10.0),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              getRequiredLabel(city),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: cityAddressController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: borderBg,
                                    hintText: city,
                                    hintStyle:
                                        const TextStyle(color: hintColor),
                                    prefixIcon: Image.asset(nameIcon),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        5.0, 10.0, 5.0, 10.0),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              getRequiredLabel(state),
                              DropdownButtonFormField<String>(
                                isExpanded: true,
                                items: dropDownItems,
                                hint: Text(selectState),
                                onChanged: (value) {
                                  selectState = value!;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: borderBg,
                                  contentPadding: const EdgeInsets.only(
                                      left: 40, right: 40, bottom: 15, top: 15),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(
                                    // <--- this line
                                    borderRadius: BorderRadius.circular(
                                        10), // <--- this line
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              getHeaderLabelText(specialization),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: specializationController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: borderBg,
                                    hintText: specialization,
                                    hintStyle:
                                        const TextStyle(color: hintColor),
                                    prefixIcon: Image.asset(stethoscopeIcon),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        5.0, 10.0, 5.0, 10.0),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              getRequiredLabel(hospitalName),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: hospitalNameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: borderBg,
                                    hintText: hospitalName,
                                    hintStyle:
                                        const TextStyle(color: hintColor),
                                    prefixIcon: Image.asset(hospitalIcon),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        5.0, 10.0, 5.0, 10.0),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              getRequiredLabel(password),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: passwordVisible,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: borderBg,
                                      hintText: enterYourPassword,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          5.0, 10.0, 5.0, 10.0),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      suffixIcon: IconButton(
                                        icon: Icon(passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(
                                            () {
                                              passwordVisible =
                                                  !passwordVisible;
                                            },
                                          );
                                        },
                                      ),
                                      hintStyle:
                                          const TextStyle(color: hintColor),
                                      alignLabelWithHint: false,
                                      prefixIcon: Image.asset(passwordIcon)),
                                  validator: (value) => value!.length < 6
                                      ? 'Must be at least 6 characters'
                                      : null,
                                ),
                              ),
                              const SizedBox(height: 10),
                              getRequiredLabel(confirmPassword),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: confirmPasswordController,
                                  obscureText: confirmPasswordVisible,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: borderBg,
                                      hintText: confirmPassword,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          5.0, 10.0, 5.0, 10.0),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      suffixIcon: IconButton(
                                        icon: Icon(confirmPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(
                                            () {
                                              confirmPasswordVisible =
                                                  !confirmPasswordVisible;
                                            },
                                          );
                                        },
                                      ),
                                      hintStyle:
                                          const TextStyle(color: hintColor),
                                      alignLabelWithHint: false,
                                      prefixIcon: Image.asset(passwordIcon)),
                                  validator: (value) => value!.length < 6
                                      ? 'Must be at least 6 characters'
                                      : null,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              side: BorderSide(
                                                  color: Colors.red)))),
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();

                                    validateRegisterForms();
                                  },
                                  child: const Text(continueText,
                                      style: TextStyle(fontSize: 14))),
                              const SizedBox(height: 10),
                            ]))))));
  }

  Future<void> _dateOfBirthPicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime.now());

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        dateOfBirthController.text =
            formattedDate; //set output date to TextField value.
      });
    } else {}
  }

  void validateRegisterForms() {
    if (firstNameController.text.isEmpty) {
      showDialog(firstNameError);
      return;
    }
    if (lastNameController.text.isEmpty) {
      showDialog(lastNameError);
      return;
    }
    if (emailValidator(emailController.text)) {
      showDialog(invalidEmailID);
      return;
    }
    if (selectGender.isEmpty) {
      showDialog(genderError);
    }
    if (selectState == "Select State") {
      showDialog("Please Select State");
      return;
    }
    if (passwordController.text.length < 5) {
      showDialog(passwordError);
      return;
    }
    if (confirmPasswordController.text.length < 5) {
      showDialog(confirmPasswordError);
      return;
    }
    submitDetails();
  }

  void submitDetails() async {
    setState(() {
      isLoading = true;
    });

    var homeAddressObj = HomeAddress(
        address: homeAddressController.text,
        city: cityAddressController.text,
        state: selectState,
        country: "India");

    var communityDetailsObj = CommunityDetails(
        communityReferrals: [], kapuCommunityAffiliation: false);

    var communicationPreferencesObj = CommunicationPreferences(
        notificationPreferenceOnApp: "Push", communicationChannel: "Email");

    var professionalDetailsObj = ProfessionalDetails(
        hospitalAddress: [],
        clinicAddress: [],
        mostlyTreatedDiseases: [],
        medicalCertificates: [],
        specialization: specializationController.text,
        hospitalName: hospitalNameController.text);

    var userProfile = UserProfile(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        gender: selectGender,
        dateOfBirth: dateOfBirthController.text,
        contactNumber: contactNoController.text,
        email: emailController.text,
        password: passwordController.text,
        homeAddress: homeAddressObj,
        communityDetails: communityDetailsObj,
        communicationPreferences: communicationPreferencesObj,
        professionalDetails: professionalDetailsObj);

    try {
      var apiResponseModel = await ApiService.registerUser(userProfile);
      if (apiResponseModel.status) {
        showCustomAlertDialog(
            context, "Message", apiResponseModel.message, {gotoLoginScreen()});
      } else {
        showDialog(apiResponseModel.message);
      }
    } catch (e) {
      showDialog(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showDialog(String message) {
    showAlertDialog(context, "Message", message);
  }

  Row getRequiredLabel(String labelName) {
    return Row(children: [
      Text(labelName,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: poppins,
              fontWeight: FontWeight.w500)),
      const Text("*", style: TextStyle(color: Colors.red))
    ]);
  }

  Row getDateOfBirthLabel(String labelName) {
    return Row(children: [
      Text(labelName,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: poppins,
              fontWeight: FontWeight.w500)),
      const Text("*", style: TextStyle(color: Colors.red))
    ]);
  }

  Text getHeaderLabelText(String labelName) {
    return Text(labelName,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: poppins,
            fontWeight: FontWeight.w500));
  }

  void gotoLoginScreen() {
    push(context, const LoginScreen());
  }
}
