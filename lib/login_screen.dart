import 'package:flutter/material.dart';
import 'package:kapu_balija_doctors/registration_screen.dart';
import 'package:kapu_balija_doctors/services/helper.dart';
import 'package:kapu_balija_doctors/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  final AutovalidateMode _validate = AutovalidateMode.disabled;
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 100.0, right: 16.0, left: 16.0),
            child: Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
            child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.next,
                validator: validateEmail,
                onSaved: (String? val) {
                  email = val;
                },
                style: const TextStyle(fontSize: 18.0),
                keyboardType: TextInputType.emailAddress,
                cursorColor: const Color(COLOR_PRIMARY),
                decoration: getInputDecoration(
                    hint: 'Email Address',
                    darkMode: isDarkMode(context),
                    errorColor: Theme.of(context).errorColor)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
            child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                obscureText: true,
                validator: validatePassword,
                onSaved: (String? val) {
                  password = val;
                },
                /*onFieldSubmitted: (password) => context
                    .read<LoginBloc>()
                    .add(ValidateLoginFieldsEvent(_key)),*/
                textInputAction: TextInputAction.done,
                style: const TextStyle(fontSize: 18.0),
                cursorColor: const Color(COLOR_PRIMARY),
                decoration: getInputDecoration(
                    hint: 'Password',
                    darkMode: isDarkMode(context),
                    errorColor: Theme.of(context).errorColor)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 24),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                /*onTap: () =>
                    push(context, const ResetPasswordScreen()),*/
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 1),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(
                    top: 12, left: 20, right: 20, bottom: 12),
                backgroundColor: const Color(COLOR_PRIMARY),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(
                    color: Color(COLOR_PRIMARY),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Log In',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                      top: 12, left: 20, right: 20, bottom: 12),
                  backgroundColor: const Color(COLOR_PRIMARY),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: const BorderSide(
                      color: Color(COLOR_PRIMARY),
                    ),
                  ),
                ),
                onPressed: () {
                  push(context, const RegisterScreen());
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
