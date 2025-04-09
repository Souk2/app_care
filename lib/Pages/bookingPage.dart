import 'package:flutter/material.dart';

class bookingPage extends StatefulWidget {
  const bookingPage({super.key});

  @override
  State<bookingPage> createState() => _bookingPageState();
}

class _bookingPageState extends State<bookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Hello Booking")],
          ),
        ),
      ),
    );
  }
}
