import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:kapu_balija_doctors/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding:  const EdgeInsets.only(left:16, right:16),
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
              const SizedBox(height: 32,),
              TextFormField(
                controller: emailController,
                //cursorColor: Colors.white,
                style: const TextStyle(color: Colors.black),
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
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passwordController,
               // cursorColor: Colors.white,

                style: const TextStyle(color: Colors.black),
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
                      Icons.lock,
                      color: Colors.black,
                    )),
                validator: (value) => value!.length < 6
                    ? 'Must be at least 6 characters'
                    : null,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //elevation: 1,
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding:
                      const EdgeInsets.only(top: 12, bottom: 12)),
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();

                    if (_formKey.currentState!.validate()) {
                      login();

                    }
                  },
                  child: const Text('Login')),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                    },
                  ),
                  GestureDetector(
                    child: const Text("Forgot Password?",
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),

                 isLoading ? const Center(
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

void login() async{
if(await InternetConnectionChecker().hasConnection == true){
  Map<String,dynamic> request = {'email': emailController.text, 'password': passwordController.text};
  final uri = Uri.http("${baseUrl}api/users/login");
  var response = await http.post(uri, body: request);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');


}else{
  debugPrint("No internet");
}
}

}

