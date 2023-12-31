import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kapu_balija_doctors/search_doctors_screen.dart';

import 'registration_screen.dart';
import 'services/helper.dart';
import 'utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  bool isLoading = false;
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 229, 204),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                  padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
                  child: TextFormField(
                    controller: emailController,
                    //cursorColor: Colors.white,
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
                    validator: (value) => !value!.contains('@')
                        ? 'Please enter valid email'
                        : null,
                  )),
              Padding(
                  padding:
                  const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: passwordVisible,
                    // cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintStyle: const TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                                  () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        alignLabelWithHint: false,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        )),
                    validator: (value) => value!.length < 6
                        ? 'Must be at least 6 characters'
                        : null,
                  )),
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

                        if (_formKey.currentState!.validate()) {
                          login();
                        }
                      },
                      child: const Text('Submit'))),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /*GestureDetector(
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {},
                  ),*/
                  GestureDetector(
                    child: const Text("Don't have an account?",
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      push(context, const RegisterScreen());
                    },
                  )
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
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    setState(() {
      isLoading = true;
    });
    try {
      final uri = Uri.parse("${baseUrl}api/users/login");
      Response response = await post(uri, body: {
        'email': emailController.text,
        'password': passwordController.text
      });

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        //var data = jsonDecode(response.body.toString());
        gotoSearchDoctorsScreen();
      } else {
        showDialog(response.body);
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      showDialog(e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }

  void showDialog(String message) {
    showAlertDialog(context, "Message", message);
  }

  void gotoSearchDoctorsScreen() {
    pushReplacement(context, const SearchDoctorsScreen());
  }
}
