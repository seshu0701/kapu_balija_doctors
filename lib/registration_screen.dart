import 'package:flutter/material.dart';
import 'package:kapu_balija_doctors/services/helper.dart';
import 'package:kapu_balija_doctors/utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
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
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                  onSaved: (String? val) {
                    //email = val;
                  },
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.text,
                  cursorColor: const Color(colorPrimary),
                  decoration: getInputDecoration(
                      hint: 'First Name',
                      darkMode: isDarkMode(context),
                      errorColor: Theme.of(context).errorColor)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                  onSaved: (String? val) {
                    //email = val;
                  },
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.text,
                  cursorColor: const Color(colorPrimary),
                  decoration: getInputDecoration(
                      hint: 'Middle Name',
                      darkMode: isDarkMode(context),
                      errorColor: Theme.of(context).errorColor)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                  onSaved: (String? val) {
                    //email = val;
                  },
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.text,
                  cursorColor: const Color(colorPrimary),
                  decoration: getInputDecoration(
                      hint: 'Last Name',
                      darkMode: isDarkMode(context),
                      errorColor: Theme.of(context).errorColor)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                  onSaved: (String? val) {
                    //email = val;
                  },
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.multiline,
                  cursorColor: const Color(colorPrimary),
                  decoration: getInputDecoration(
                      hint: 'Home Address',
                      darkMode: isDarkMode(context),
                      errorColor: Theme.of(context).errorColor)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                  onSaved: (String? val) {
                    //email = val;
                  },
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.multiline,
                  cursorColor: const Color(colorPrimary),
                  decoration: getInputDecoration(
                      hint: 'Home Address or Clinic Address',
                      darkMode: isDarkMode(context),
                      errorColor: Theme.of(context).errorColor)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                  onSaved: (String? val) {
                    //email = val;
                  },
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color(colorPrimary),
                  decoration: getInputDecoration(
                      hint: 'Email',
                      darkMode: isDarkMode(context),
                      errorColor: Theme.of(context).errorColor)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                  onSaved: (String? val) {
                    //email = val;
                  },
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  cursorColor: const Color(colorPrimary),
                  decoration: getInputDecoration(
                      hint: 'Contact No',
                      darkMode: isDarkMode(context),
                      errorColor: Theme.of(context).errorColor)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                  onSaved: (String? val) {
                    //email = val;
                  },
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.text,
                  cursorColor: const Color(colorPrimary),
                  decoration: getInputDecoration(
                      hint: 'Education Qualification',
                      darkMode: isDarkMode(context),
                      errorColor: Theme.of(context).errorColor)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                  onSaved: (String? val) {
                    //email = val;
                  },
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.multiline,
                  cursorColor: const Color(colorPrimary),
                  decoration: getInputDecoration(
                      hint: 'Speciality',
                      darkMode: isDarkMode(context),
                      errorColor: Theme.of(context).errorColor)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
              child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  validator: validateEmail,
                  onSaved: (String? val) {
                    //email = val;
                  },
                  style: const TextStyle(fontSize: 18.0),
                  keyboardType: TextInputType.multiline,
                  cursorColor: const Color(colorPrimary),
                  decoration: getInputDecoration(
                      hint: 'Mostly Treated Diseases',
                      darkMode: isDarkMode(context),
                      errorColor: Theme.of(context).errorColor)),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                        top: 12, left: 20, right: 20, bottom: 12),
                    backgroundColor: const Color(colorPrimary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(
                        color: Color(colorPrimary),
                      ),
                    ),
                  ),
                  onPressed: () {
                    submitDetails();
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ));
  }

  void submitDetails() {}
}
