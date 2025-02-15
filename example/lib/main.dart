import 'dart:async';
import 'dart:developer';

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(
      Duration(
        seconds: 3,
      ),
      (timer) {
        setState(() {
          _isLoading = !_isLoading;
        });
        log("Isloading $_isLoading");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedButton(
          isLoading: _isLoading,
          height: 70,
          width: 300,
          radius: BorderRadius.circular(
            40,
          ),
          buttonName: "Login",
          onTap: () {
            // Perform some actions here
          },
        ),
      ),
    );
  }
}
