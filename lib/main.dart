import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kapu_balija_doctors/utils/constants.dart';
import 'package:kapu_balija_doctors/utils/images.dart';

import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
    /*Timer(const Duration(seconds: 2),
        () => pushReplacement(context, const LoginScreen()));*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          SizedBox(
            height: constraints.maxHeight / 3,
            width: constraints.maxWidth,
            child: Container(
              decoration: const BoxDecoration(),
              child: ClipRRect(
                child: Image.asset(bgLogoOne),
              ),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight / 3,
            width: constraints.maxWidth,
            child: Container(
              decoration: const BoxDecoration(),
              child: ClipRRect(
                child: Image.asset(bgSplashLogo),
              ),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight / 3,
            width: constraints.maxWidth,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: Text(splashTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(colorRed),
                            fontSize: 24,
                            fontWeight: FontWeight.bold))),
                Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Text(splashDesc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
