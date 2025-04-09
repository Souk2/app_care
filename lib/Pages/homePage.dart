import 'dart:ffi';

import 'package:app_care/specialties_doctor.dart/cardiology.dart';
import 'package:app_care/specialties_doctor.dart/dermatology.dart';
import 'package:app_care/specialties_doctor.dart/generalmedicine.dart';
import 'package:app_care/specialties_doctor.dart/gynecology.dart';
import 'package:app_care/specialties_doctor.dart/odontology.dart';
import 'package:app_care/specialties_doctor.dart/oncology.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  // int _selectedIndex = 0; // สำหรับ Bottom Navigation Bar
  DateTime _selectedDate =
      DateTime.now(); // วันที่ที่เลือก (เริ่มต้นเป็นวันนี้)

  Widget ShowHi() {
    return Text(
      "Hi, WelcomeBack",
      textAlign: TextAlign.end,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 0, 187, 211),
        fontFamily: 'PlayfairDisplay',
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title,
      String actionText, VoidCallback onActionPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 18)),
          TextButton(
            onPressed: onActionPressed,
            child: Text(actionText),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันสำหรับแสดงวันที่ในแถบแนวนอน
  Widget _buildDateSelector(BuildContext context) {
    List<Widget> dateWidgets = [];
    DateTime now = DateTime.now();
    // สร้างวันที่สำหรับ 7 วัน (ตัวอย่าง: 3 วันก่อนหน้า, วันนี้, 3 วันถัดไป)
    // คุณสามารถปรับช่วงวันที่ตามต้องการ
    for (int i = -3; i <= 3; i++) {
      DateTime date = now.add(Duration(days: i));
      bool isSelected = DateUtils.isSameDay(_selectedDate, date);
      bool isToday = DateUtils.isSameDay(now, date);

      dateWidgets.add(
        InkWell(
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 60, // กำหนดความกว้างคงที่
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              // // border: border,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF33E4DB),
                  Color(0xFF00BBD3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border.all(color: Colors.white),
              color: isSelected
                  ? Theme.of(context).primaryColor.withOpacity(0.9)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('d').format(date), // แสดงเลขวัน
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('E')
                      .format(date)
                      .toUpperCase(), // แสดงชื่อวันย่อ (MON, TUE)
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white70 : Colors.black54,
                  ),
                ),
                if (isToday) // แสดงคำว่า Today ถ้าเป็นวันปัจจุบัน
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 10,
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    // ใช้ SingleChildScrollView เพื่อให้เลื่อนแนวนอนได้
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // ปุ่ม < (ยังไม่ใส่ logic การเลื่อนสัปดาห์)
          // IconButton(icon: Icon(Icons.chevron_left), onPressed: () {}),
          ...dateWidgets,
          // ปุ่ม > (ยังไม่ใส่ logic การเลื่อนสัปดาห์)
          // IconButton(icon: Icon(Icons.chevron_right), onPressed: () {}),
        ],
      ),
    );
  }

  Widget ShowName() {
    return Text(
      "Jane Doe",
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'PlayfairDisplay',
      ),
    );
  }

  Widget ShowCat() {
    return Text(
      "Categories",
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 0, 187, 211),
        fontFamily: 'PlayfairDisplay',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            // color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 246, 254),
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    child: Image.asset(
                      "images/IconNofi.png",
                      height: 20,
                      width: 20,
                      color: null,
                    ),
                  ),
                  onPressed: () {
                    // ฟังก์ชันเมื่อกดปุ่มแจ้งเตือน
                    print("hello");
                  },
                ),
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 246, 254),
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    child: Image.asset(
                      "images/Iconsetting.png",
                      height: 20,
                      width: 20,
                      color: null,
                    ),
                  ),
                  onPressed: () {
                    // ฟังก์ชันเมื่อกดปุ่มแจ้งเตือน
                  },
                ),
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 246, 254),
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    child: Image.asset(
                      "images/IconSearch.png",
                      height: 20,
                      width: 20,
                      color: null,
                    ),
                  ),
                  onPressed: () {
                    // ฟังก์ชันเมื่อกดปุ่มแจ้งเตือน
                  },
                ),
                SizedBox(
                  width: 80,
                ),
                GestureDetector(
                  onTap: () {
                    // ฟังก์ชันเมื่อแตะที่ส่วนโปรไฟล์
                    print("Profile tapped!");
                  },
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: ShowHi(),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                            child: ShowName(),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                          // backgroundImage: NetworkImage(
                          //     "URL_ของ_รูปภาพ_โปรไฟล์"), // แทนที่ด้วย URL จริง
                          ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              // Container(
              //   padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
              //   child: Row(
              //     children: [
              //       IconButton(
              //         icon: Container(
              //           padding: const EdgeInsets.all(10.0),
              //           decoration: BoxDecoration(
              //             color: Color.fromARGB(255, 233, 246, 254),
              //             borderRadius: BorderRadius.circular(90.0),
              //           ),
              //           child: Image.asset(
              //             "images/IconNofi.png",
              //             height: 20,
              //             width: 20,
              //             color: null,
              //           ),
              //         ),
              //         onPressed: () {
              //           // ฟังก์ชันเมื่อกดปุ่มแจ้งเตือน
              //           print("hello");
              //         },
              //       ),
              //       IconButton(
              //         icon: Container(
              //           padding: const EdgeInsets.all(10.0),
              //           decoration: BoxDecoration(
              //             color: Color.fromARGB(255, 233, 246, 254),
              //             borderRadius: BorderRadius.circular(90.0),
              //           ),
              //           child: Image.asset(
              //             "images/Iconsetting.png",
              //             height: 20,
              //             width: 20,
              //             color: null,
              //           ),
              //         ),
              //         onPressed: () {
              //           // ฟังก์ชันเมื่อกดปุ่มแจ้งเตือน
              //         },
              //       ),
              //       IconButton(
              //         icon: Container(
              //           padding: const EdgeInsets.all(10.0),
              //           decoration: BoxDecoration(
              //             color: Color.fromARGB(255, 233, 246, 254),
              //             borderRadius: BorderRadius.circular(90.0),
              //           ),
              //           child: Image.asset(
              //             "images/IconSearch.png",
              //             height: 20,
              //             width: 20,
              //             color: null,
              //           ),
              //         ),
              //         onPressed: () {
              //           // ฟังก์ชันเมื่อกดปุ่มแจ้งเตือน
              //         },
              //       ),
              //       SizedBox(
              //         width: 80,
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           // ฟังก์ชันเมื่อแตะที่ส่วนโปรไฟล์
              //           print("Profile tapped!");
              //         },
              //         child: Row(
              //           children: [
              //             Column(
              //               children: [
              //                 ShowHi(),
              //                 Padding(
              //                   padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              //                   child: ShowName(),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(width: 10),
              //             CircleAvatar(
              //                 // backgroundImage: NetworkImage(
              //                 //     "URL_ของ_รูปภาพ_โปรไฟล์"), // แทนที่ด้วย URL จริง
              //                 ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: [
                    ShowCat(),
                    SizedBox(
                      width: 245,
                    ),
                    TextButton(
                      onPressed: () {
                        // ฟังก์ชันเมื่อกด "See all"
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 0, 187, 211),
                          color: Color.fromARGB(255, 0, 187, 211),
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color.fromARGB(80, 0, 187, 211),
                thickness: 2,
                indent: 20, // ระยะเยื้องจากขอบซ้าย
                endIndent: 20, // ระยะเยื้องจากขอบขวา
              ),
              ////////////////////////////////////////////Row Cat
              Row(
                children: [
                  SizedBox(
                    width: 27,
                  ),
                  SizedBox(
                    width: 75,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // ฟังก์ชันเมื่อกดปุ่ม
                        print("Button pressed!");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets
                            .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                        shape: RoundedRectangleBorder(
                          // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                        children: [
                          Image.asset(
                            'images/heart_icon.png', // แทนที่ด้วยพาธรูปภาพจริง
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Favorite",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 187, 211),
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //Doctor/////////////////////////////////
                  SizedBox(
                    width: 75, // กำหนดความกว้างที่ต้องการ
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // ฟังก์ชันเมื่อกดปุ่ม
                        print("Doctors pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets
                            .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                        shape: RoundedRectangleBorder(
                          // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                        children: [
                          Image.asset(
                            'images/doctors_icon.png', // แทนที่ด้วยพาธรูปภาพจริง
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Doctors",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 187, 211),
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //Pharmacy/////////////////////////////////
                  SizedBox(
                    width: 75, // กำหนดความกว้างที่ต้องการ
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // ฟังก์ชันเมื่อกดปุ่ม
                        print("pharmacy pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets
                            .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                        shape: RoundedRectangleBorder(
                          // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                        children: [
                          Image.asset(
                            'images/pharmacy_icon.png', // แทนที่ด้วยพาธรูปภาพจริง
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Pharmacy",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 187, 211),
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //specialties_icon/////////////////////////////////
                  SizedBox(
                    width: 75, // กำหนดความกว้างที่ต้องการ
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // ฟังก์ชันเมื่อกดปุ่ม
                        print("specialties_icon pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets
                            .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                        shape: RoundedRectangleBorder(
                          // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                        children: [
                          Image.asset(
                            'images/specialties_icon.png', // แทนที่ด้วยพาธรูปภาพจริง
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Specialties",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 187, 211),
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  //record_icon/////////////////////////////////
                  SizedBox(
                    width: 75, // กำหนดความกว้างที่ต้องการ
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // ฟังก์ชันเมื่อกดปุ่ม
                        print("record_icon pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets
                            .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                        shape: RoundedRectangleBorder(
                          // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                        children: [
                          Image.asset(
                            'images/record_icon.png', // แทนที่ด้วยพาธรูปภาพจริง
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Record",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 187, 211),
                              fontFamily: 'PlayfairDisplay',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 51, 228, 219),
                      Color.fromARGB(255, 0, 187, 211),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 440, // กำหนดความกว้างตามต้องการ
                    height: 325, // กำหนดความสูงตามต้องการ
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                "Upcoming Schedule",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PlayfairDisplay',
                                ),
                              ),
                              SizedBox(
                                width: 205,
                              ),
                              Text(
                                "Month",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'PlayfairDisplay',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 20, // ระยะเยื้องจากขอบซ้าย
                          endIndent: 20, // ระยะเยื้องจากขอบขวา
                        ),

                        ///
                        /////
                        /////
                        /////
                        ///
                        _buildDateSelector(context), // แถบเลือกวันที
                        Container(
                          width: 360,
                          height: 165,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 34,
                                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        // ฟังก์ชันเมื่อกด "See all"
                                      },
                                      child: const Text(
                                        "See all",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color.fromARGB(
                                              255, 255, 255, 255),
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: 'PlayfairDisplay',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Color.fromARGB(180, 255, 255, 255),
                                thickness: 2,
                                indent: 20, // ระยะเยื้องจากขอบซ้าย
                                endIndent: 20, // ระยะเยื้องจากขอบขวา
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '11 ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          'Month - Wednesday -',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PlayfairDisplay",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          ' Today',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PlayfairDisplay",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          ' 10:00',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          ' am ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PlayfairDisplay",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          ' Dr. Olivia Turner',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PlayfairDisplay",
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Color.fromARGB(180, 255, 255, 255),
                                thickness: 2,
                                indent: 20, // ระยะเยื้องจากขอบซ้าย
                                endIndent: 20, // ระยะเยื้องจากขอบขวา
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '12 ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          'Month - Monday',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PlayfairDisplay",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          ' 08:00 ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          ' am ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PlayfairDisplay",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          ' Dr. Alexander Bennett',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PlayfairDisplay",
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //////////////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////////////
              ///
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Specialties",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 187, 211),
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
                    SizedBox(
                      width: 245,
                    ),
                    TextButton(
                      onPressed: () {
                        // ฟังก์ชันเมื่อกด "See all"
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 0, 187, 211),
                          color: Color.fromARGB(255, 0, 187, 211),
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color.fromARGB(80, 0, 187, 211),
                thickness: 2,
                indent: 20, // ระยะเยื้องจากขอบซ้าย
                endIndent: 20, // ระยะเยื้องจากขอบขวา
              ),
              ///////////////// Specialties
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 10, 0, 0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 130,
                          height: 120,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 51, 228, 219),
                                  Color.fromARGB(255, 0, 187, 211)
                                ], // Added a second color for gradient.
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // ฟังก์ชันเมื่อกดปุ่ม
                                Navigator.of(context).pop();
                                MaterialPageRoute route = MaterialPageRoute(
                                  builder: (_) =>
                                      cardiologyScreen(specialty: ""),
                                );
                                Navigator.of(context).push(route);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets
                                    .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                                shape: RoundedRectangleBorder(
                                  // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                                children: [
                                  Image.asset(
                                    'images/Cardiology.png', // แทนที่ด้วยพาธรูปภาพจริง
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "Cardiology",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        //Dermatology/////////////////////////////////
                        SizedBox(
                          width: 130, // กำหนดความกว้างที่ต้องการ
                          height: 120,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 51, 228, 219),
                                  Color.fromARGB(255, 0, 187, 211)
                                ], // Added a second color for gradient.
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // ฟังก์ชันเมื่อกดปุ่ม
                                Navigator.of(context).pop();
                                MaterialPageRoute route = MaterialPageRoute(
                                  builder: (_) =>
                                      DermatologyScreen(specialty: ""),
                                );
                                Navigator.of(context).push(route);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets
                                    .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                                shape: RoundedRectangleBorder(
                                  // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                                children: [
                                  Image.asset(
                                    'images/Dermatology.png', // แทนที่ด้วยพาธรูปภาพจริง
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "Dermatology",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        //General medicine/////////////////////////////////
                        SizedBox(
                          width: 130, // กำหนดความกว้างที่ต้องการ
                          height: 120,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 51, 228, 219),
                                  Color.fromARGB(255, 0, 187, 211)
                                ], // Added a second color for gradient.
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // ฟังก์ชันเมื่อกดปุ่ม
                                Navigator.of(context).pop();
                                MaterialPageRoute route = MaterialPageRoute(
                                  builder: (_) =>
                                      generalmedicineScreen(specialty: ""),
                                );
                                Navigator.of(context).push(route);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets
                                    .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                                shape: RoundedRectangleBorder(
                                  // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                                children: [
                                  Image.asset(
                                    'images/g_medicine.png', // แทนที่ด้วยพาธรูปภาพจริง
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "General\nmedicine",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /////////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////////////
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 10, 0, 20),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 130,
                          height: 120,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 51, 228, 219),
                                  Color.fromARGB(255, 0, 187, 211)
                                ], // Added a second color for gradient.
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // ฟังก์ชันเมื่อกดปุ่ม
                                Navigator.of(context).pop();
                                MaterialPageRoute route = MaterialPageRoute(
                                  builder: (_) =>
                                      gynecologyScreen(specialty: ""),
                                );
                                Navigator.of(context).push(route);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets
                                    .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                                shape: RoundedRectangleBorder(
                                  // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                                children: [
                                  Image.asset(
                                    'images/Gynecology.png', // แทนที่ด้วยพาธรูปภาพจริง
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "Gynecology",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        //Odontology/////////////////////////////////
                        SizedBox(
                          width: 130, // กำหนดความกว้างที่ต้องการ
                          height: 120,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 51, 228, 219),
                                  Color.fromARGB(255, 0, 187, 211)
                                ], // Added a second color for gradient.
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // ฟังก์ชันเมื่อกดปุ่ม
                                Navigator.of(context).pop();
                                MaterialPageRoute route = MaterialPageRoute(
                                  builder: (_) =>
                                      odontologyScreen(specialty: ""),
                                );
                                Navigator.of(context).push(route);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets
                                    .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                                shape: RoundedRectangleBorder(
                                  // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                                children: [
                                  Image.asset(
                                    'images/Odontology.png', // แทนที่ด้วยพาธรูปภาพจริง
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "Odontology",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        //Oncology/////////////////////////////////
                        SizedBox(
                          width: 130, // กำหนดความกว้างที่ต้องการ
                          height: 120,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 51, 228, 219),
                                  Color.fromARGB(255, 0, 187, 211)
                                ], // Added a second color for gradient.
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // ฟังก์ชันเมื่อกดปุ่ม
                                Navigator.of(context).pop();
                                MaterialPageRoute route = MaterialPageRoute(
                                  builder: (_) => oncologyScreen(specialty: ""),
                                );
                                Navigator.of(context).push(route);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets
                                    .zero, // ลบ padding ภายในเริ่มต้น (ถ้าไม่ต้องการ)
                                shape: RoundedRectangleBorder(
                                  // กำหนดรูปร่างเป็นสี่เหลี่ยม (ไม่มีขอบมน)
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // ให้ Column มีขนาดเล็กที่สุดเท่าที่เนื้อหาต้องการ
                                children: [
                                  Image.asset(
                                    'images/Oncology.png', // แทนที่ด้วยพาธรูปภาพจริง
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "Oncology",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PlayfairDisplay',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
