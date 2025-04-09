import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
                    height: 300, // กำหนดความสูงตามต้องการ
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
                        Text(
                          "What are we going to do?",
                          style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
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
                                print("Button pressed!");
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
                        //Doctor/////////////////////////////////
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
                                print("Doctors pressed");
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
                        //Pharmacy/////////////////////////////////
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
                                print("pharmacy pressed");
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
                                print("Button pressed!");
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
                        //Doctor/////////////////////////////////
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
                                print("Doctors pressed");
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
                        //Pharmacy/////////////////////////////////
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
