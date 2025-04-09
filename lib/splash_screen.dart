// import 'package:app_care/Login/login.dart';
import 'package:app_care/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  Widget ShowText() {
    return Text(
      "CareConnect",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'PlayfairDisplay',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 51, 228, 219),
              Color.fromARGB(255, 0, 187, 211)
            ], // Added a second color for gradient.
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: ClipPath(
                child: Image.asset(
                  "images/Vector.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ShowText(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
