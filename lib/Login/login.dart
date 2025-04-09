import 'package:app_care/Pages/Screens/homeScreen.dart';
import 'package:app_care/login_signup/loginA.dart';
import 'package:app_care/login_signup/signup.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  Widget ShowTextCare() {
    return Text(
      "Care",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 0, 187, 211),
        fontFamily: 'PlayfairDisplay',
      ),
    );
  }

  Widget ShowTextShowTextCare() {
    return Text(
      "Connect",
      style: TextStyle(
        fontSize: 35,
        color: Color.fromARGB(255, 51, 228, 219),
        fontFamily: 'PlayfairDisplay',
      ),
    );
  }

  Widget LoginButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 51, 228, 219),
            Color.fromARGB(255, 0, 187, 211),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(100), // optional
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.width * 0.13,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            MaterialPageRoute route = MaterialPageRoute(
              builder: (_) => LoginScreen(),
            );
            Navigator.of(context).push(route);
          },
          child: Text(
            'Log in',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: 'PlayfairDisplay',
            ),
          ),
        ),
      ),
    );
  }

  Widget SignUpButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.width * 0.13,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 233, 246, 254),
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          Navigator.of(context).pop();
          MaterialPageRoute route = MaterialPageRoute(
            builder: (_) => SignUpScreen(),
          );
          Navigator.of(context).push(route);
        },
        child: Text(
          'Sign up',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 187, 211),
            fontSize: 35,
            fontFamily: 'PlayfairDisplay',
          ),
        ),
      ),
    );
  }

  Widget logUp() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LoginButton(),
        SizedBox(
          height: 15,
        ),
        SignUpButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: ClipPath(
                child: Image.asset(
                  "images/Vector_blue.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowTextCare(),
                ShowTextShowTextCare(),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 40),
            logUp()
          ],
        ),
      ),
    );
  }
}
