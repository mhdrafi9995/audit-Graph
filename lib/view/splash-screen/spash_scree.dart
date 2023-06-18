import 'dart:async';

import 'package:flutter/material.dart';

import '../login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 1500,
        ));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceInOut);
    _animationController.forward();
    Timer(
        const Duration(milliseconds: 2500),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            )));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset(
              "assets/images/petro_logo_f1.png",
              width: 250,
            ),
          ),
        ),
      ),
    );
  }
}
