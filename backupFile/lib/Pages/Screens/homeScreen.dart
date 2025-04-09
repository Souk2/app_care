import 'package:app_care/Pages/homePage.dart';
import 'package:app_care/Pages/footer.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: footer(), // นำ FooterWidget มาแสดง
          ),
        ],
      ),
    );
  }
}
