import 'package:flutter/material.dart';
import 'package:kapu_balija_doctors/registration_screen.dart';
import 'package:kapu_balija_doctors/search_doctors_home_screen.dart';
import 'package:kapu_balija_doctors/utils/api_service.dart';
import 'package:kapu_balija_doctors/utils/images.dart';
import 'package:kapu_balija_doctors/utils/utils.dart';

import 'services/helper.dart';
import 'utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController =
      TextEditingController(text: "s.seshu143@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "Vidhita@0701");
  bool isLoading = false;
  bool passwordVisible = false;
  bool _isValidEmail = false;
  final bool _isValidPassword = false;
  bool rememberMeSelected = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                  child: Form(
                    key: _formKey,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24, top: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(bgLogoOne, width: 200, height: 150),
                              getHeaderLabelText(emailId),
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
                                          0.0, 10.0, 0.0, 0.0),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                    ),
                                    validator: (value) => !emailValidator(value)
                                        ? null
                                        : 'Please enter valid email',
                                  )),
                              const SizedBox(height: 10),
                              getHeaderLabelText(password),
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
                                          0.0, 10.0, 0.0, 0.0),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: _isValidPassword
                                                ? redBg
                                                : borderBg),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
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
                              Row(children: [
                                Image.asset(unCheckedIcon),
                                const SizedBox(width: 10),
                                getHeaderLabelText(rememberMe)
                              ]),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              side: BorderSide(
                                                  color: Colors.red)))),
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    /*if (_formKey.currentState!.validate()) {
                                      login();
                                    }*/
                                    validateLoginDetails();
                                  },
                                  child: const Text(signIn, style: TextStyle(fontSize: 14))),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //Center Row contents horizontally,
                                children: [
                                  const Text(dontHaveAnAccount,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.black)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      child: const Text(signupHere,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                            fontFamily: poppins,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          )),
                                      onTap: () {
                                        push(context, const RegisterScreen());
                                      })
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ))
                                  : const SizedBox()
                            ])),
                  ),
                ))));
  }

  Text getHeaderLabelText(String labelName) {
    return Text(labelName,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: poppins,
            fontWeight: FontWeight.w500));
  }

  void validateLoginDetails() {
    if (emailValidator(emailController.text)) {
      showDialog(invalidEmailID);
      return;
    }
    if (passwordController.text.length < 5) {
      showDialog(passwordError);
      return;
    }
    login();
  }

  void login() async {
    setState(() {
      isLoading = true;
    });
    try {
      var apiResponseModel = await ApiService.loginUser(
          emailController.text, passwordController.text);
      if (apiResponseModel.status) {
        gotoSearchDoctorsHomeScreen();
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

  void gotoSearchDoctorsHomeScreen() {
    push(context, const SearchDoctorsHomeScreen());
  }
}
