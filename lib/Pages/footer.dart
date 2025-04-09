import 'package:app_care/Pages/bookingPage.dart';
import 'package:app_care/Pages/chatPage.dart';
import 'package:app_care/Pages/homePage.dart';
import 'package:app_care/Pages/userPage.dart';
import 'package:flutter/material.dart';

// สร้าง Stateless Widget สำหรับแต่ละหน้า (แทนที่จะใช้ Text เฉยๆ)

class footer extends StatefulWidget {
  const footer({super.key});

  @override
  State<footer> createState() => _footerState();
}

class _footerState extends State<footer> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    homePage(),
    chatPage(),
    bookingPage(),
    userPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions
          .elementAt(_selectedIndex), // แสดง Widget ตาม Tab ที่เลือก
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/Home.png'),
              size: 30,
            ), // เปลี่ยน path ตามจริง
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/Messages.png'),
              size: 30,
            ), // เปลี่ยน path ตามจริง
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/Booking.png'),
              size: 30,
            ), // เปลี่ยน path ตามจริง
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/User_Profile.png'),
              size: 30,
            ), // เปลี่ยน path ตามจริง
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 51, 228, 219),
        backgroundColor: Color.fromARGB(255, 233, 246, 254),
        unselectedItemColor:
            Colors.grey, // สีของไอคอนและ Label เมื่อไม่ถูกเลือก
        onTap: _onItemTapped,
        showSelectedLabels: true, // แสดง Label เมื่อ Tab ถูกเลือก (ถ้ามี Label)
        showUnselectedLabels:
            false, // ไม่แสดง Label เมื่อ Tab ไม่ได้ถูกเลือก (ถ้ามี Label)
        selectedLabelStyle: const TextStyle(
          // สไตล์สำหรับ Label ที่ถูกเลือก
          fontFamily: 'PlayfairDisplay', // เปลี่ยนเป็น Font ที่คุณต้องการ
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
        ),
        type: BottomNavigationBarType.fixed, // ทำให้ Label แสดงตลอดเวลา
      ),
    );
  }
}
