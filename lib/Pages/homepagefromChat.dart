import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import package intl

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health App UI',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Roboto', // หรือ Font ที่ต้องการ
          // กำหนดสีหลักที่ใกล้เคียงกับในรูป
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.cyan,
            accentColor: Colors.cyanAccent, // สีรอง
          ).copyWith(
            secondary: Colors.cyanAccent,
            brightness: Brightness.light,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black87),
            bodyMedium: TextStyle(color: Colors.black54),
            titleLarge:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            titleMedium:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          iconTheme: const IconThemeData(color: Colors.cyan), // สีไอคอนหลัก
          cardTheme: CardTheme(
            elevation: 0, // เอาเงาออกถ้าต้องการแบบเรียบ
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Colors.cyan.shade50, // สีพื้นหลัง Card อ่อนๆ
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            foregroundColor: Colors.cyan.shade700, // สีปุ่ม "See all"
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ))),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// --- หน้าจอหลัก ---
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // สำหรับ Bottom Navigation Bar
  DateTime _selectedDate =
      DateTime.now(); // วันที่ที่เลือก (เริ่มต้นเป็นวันนี้)

  // ฟังก์ชันสำหรับเปลี่ยนหน้า Bottom Navigation Bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // เพิ่ม Logic การเปลี่ยนหน้าจริงตาม index ที่นี่
    String pageName = '';
    switch (index) {
      case 0:
        pageName = 'Home';
        break; // ไม่ต้องทำอะไร เพราะอยู่ที่หน้านี้แล้ว
      case 1:
        pageName = 'Chat';
        _navigateToPlaceholder(context, pageName);
        break;
      case 2:
        pageName = 'Profile';
        _navigateToPlaceholder(context, pageName);
        break;
      case 3:
        pageName = 'Calendar';
        _navigateToPlaceholder(context, pageName);
        break;
    }
    if (pageName != 'Home' && pageName.isNotEmpty) {
      print('Navigate to $pageName (via Bottom Nav)');
    }
  }

  // ฟังก์ชันสำหรับสร้าง Header ของแต่ละ Section
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

  // ฟังก์ชันสำหรับสร้างไอคอนใน Categories
  Widget _buildCategoryIcon(
      BuildContext context, IconData icon, String label, String pageName) {
    return InkWell(
      onTap: () => _navigateToPlaceholder(context, pageName),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30.0, color: Theme.of(context).iconTheme.color),
            const SizedBox(height: 8.0),
            Text(label,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสำหรับสร้างการ์ดนัดหมาย
  Widget _buildAppointmentCard(
      BuildContext context, String dateInfo, String time, String doctorName,
      {bool isToday = false}) {
    final Color dotColor =
        isToday ? Colors.redAccent : Theme.of(context).primaryColor;
    return InkWell(
      onTap: () =>
          _navigateToPlaceholder(context, 'Appointment Details ($doctorName)'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ส่วนจุดและเส้น (ถ้าต้องการ) - ทำให้ซับซ้อนขึ้น อาจใช้ Stack หรือ CustomPaint
            Padding(
              padding: const EdgeInsets.only(right: 12.0, top: 4.0),
              child: CircleAvatar(radius: 5, backgroundColor: dotColor),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dateInfo,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black54)),
                  const SizedBox(height: 4),
                  Text(time,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(doctorName,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสำหรับสร้างการ์ด Specialties
  Widget _buildSpecialtyCard(
      BuildContext context, IconData icon, String label, String pageName) {
    return InkWell(
      onTap: () => _navigateToPlaceholder(context, pageName),
      child: Card(
        color:
            Theme.of(context).primaryColor.withOpacity(0.1), // สีพื้นหลังอ่อนๆ
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // ทำให้มุมมนขึ้น
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0), // เพิ่ม padding ภายใน
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Theme.of(context).primaryColor),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorDark),
              ),
            ],
          ),
        ),
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
              color: isSelected
                  ? Theme.of(context).primaryColor.withOpacity(0.9)
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
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
                        fontSize: 8,
                        color: isSelected
                            ? Colors.white
                            : Theme.of(context).primaryColor,
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

  @override
  Widget build(BuildContext context) {
    // ใช้ข้อมูลวันที่ปัจจุบัน
    DateTime now = DateTime.now();
    // String todayDateFormatted = DateFormat('d MMMM - EEEE').format(now); // เช่น 11 April - Wednesday
    String todayDateInfo =
        "${DateFormat('d MMMM').format(now)} - ${DateFormat('EEEE').format(now)} - Today";
    // วันที่ตัวอย่างสำหรับนัดหมายอื่น
    DateTime nextAppointmentDate =
        now.add(const Duration(days: 5)); // สมมติอีก 5 วัน
    String nextAppointmentDateInfo =
        "${DateFormat('d MMMM').format(nextAppointmentDate)} - ${DateFormat('EEEE').format(nextAppointmentDate)}";

    return Scaffold(
      body: SafeArea(
        // ป้องกันการซ้อนทับกับ Status bar / Notch
        child: Column(
          children: [
            // --- ส่วน AppBar แบบ Custom ---
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ไอคอนด้านซ้าย
                  Row(
                    children: [
                      _buildAppBarIcon(
                          context, Icons.notifications_none, 'Notifications'),
                      const SizedBox(width: 8),
                      _buildAppBarIcon(context, Icons.settings, 'Settings'),
                      const SizedBox(width: 8),
                      _buildAppBarIcon(context, Icons.search, 'Search'),
                    ],
                  ),
                  // ข้อความต้อนรับและรูปโปรไฟล์ด้านขวา
                  InkWell(
                    // ทำให้กดได้ ถ้าต้องการไปยังหน้า Profile
                    onTap: () =>
                        _navigateToPlaceholder(context, 'User Profile'),
                    borderRadius: BorderRadius.circular(20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Hi, WelcomeBack',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.grey.shade600)),
                            Text('Jane Doe',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(width: 12),
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              'https://via.placeholder.com/150/92c952'), // ใช้ URL รูปภาพจริง หรือ AssetImage
                          // backgroundColor: Colors.grey.shade300, // สีสำรองถ้าไม่มีรูป
                          // child: Icon(Icons.person, color: Colors.white), // หรือใช้ไอคอนแทน
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // --- ส่วนเนื้อหาที่เลื่อนได้ ---
            Expanded(
              child: SingleChildScrollView(
                // ทำให้เนื้อหาเลื่อนได้ถ้าเกินหน้าจอ
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Categories ---
                    _buildSectionHeader(
                        context,
                        'Categories',
                        'See all',
                        () =>
                            _navigateToPlaceholder(context, 'All Categories')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildCategoryIcon(context, Icons.favorite_border,
                              'Favorite', 'Favorites'),
                          _buildCategoryIcon(
                              context,
                              Icons.medical_services_outlined,
                              'Doctors',
                              'Doctors'), // อาจจะต้องหาไอคอนที่เหมาะสมกว่า
                          _buildCategoryIcon(
                              context,
                              Icons.local_pharmacy_outlined,
                              'Pharmacy',
                              'Pharmacy'),
                          _buildCategoryIcon(
                              context,
                              Icons.category_outlined,
                              'Specialties',
                              'Specialties Category'), // ไอคอนชั่วคราว
                          _buildCategoryIcon(
                              context,
                              Icons.folder_copy_outlined,
                              'Record',
                              'Medical Records'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // --- Upcoming Schedule ---
                    _buildSectionHeader(
                        context,
                        'Upcoming Schedule',
                        'Month',
                        () => _navigateToPlaceholder(
                            context, 'Monthly Schedule')),
                    _buildDateSelector(context), // แถบเลือกวันที่
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 16.0,
                          top: 0,
                          bottom: 8.0), // จัดตำแหน่ง See all
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => _navigateToPlaceholder(
                              context, 'All Upcoming Schedules'),
                          child: const Text('See all'),
                        ),
                      ),
                    ),
                    // รายการนัดหมาย (ใช้ข้อมูลจาก State หรือ API จริง)
                    _buildAppointmentCard(
                        context, todayDateInfo, '10:00 am', 'Dr. Olivia Turner',
                        isToday: true),
                    _buildAppointmentCard(context, nextAppointmentDateInfo,
                        '08:00 am', 'Dr. Alexander Bennett'),
                    // เพิ่ม Card นัดหมายอื่นๆ ตามต้องการ
                    const SizedBox(height: 16),

                    // --- Specialties ---
                    _buildSectionHeader(
                        context,
                        'Specialties',
                        'See all',
                        () =>
                            _navigateToPlaceholder(context, 'All Specialties')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      // ใช้ GridView สำหรับแสดงผลแบบตาราง
                      child: GridView.count(
                        crossAxisCount: 3, // จำนวนคอลัมน์
                        shrinkWrap: true, // ให้ GridView มีขนาดเท่ากับเนื้อหา
                        physics:
                            const NeverScrollableScrollPhysics(), // ปิดการเลื่อนของ GridView เอง
                        crossAxisSpacing: 10.0, // ระยะห่างแนวนอน
                        mainAxisSpacing: 10.0, // ระยะห่างแนวตั้ง
                        childAspectRatio:
                            1.0, // อัตราส่วน กว้าง/สูง ของแต่ละช่อง (ปรับได้)
                        children: <Widget>[
                          _buildSpecialtyCard(
                              context,
                              Icons.favorite,
                              'Cardiology',
                              'Cardiology Details'), // ใช้ไอคอนจริงที่สื่อความหมาย
                          _buildSpecialtyCard(
                              context,
                              Icons.healing,
                              'Dermatology',
                              'Dermatology Details'), // ไอคอนชั่วคราว
                          _buildSpecialtyCard(
                              context,
                              Icons.medical_information,
                              'General Medicine',
                              'General Medicine Details'), // ไอคอนชั่วคราว
                          _buildSpecialtyCard(
                              context,
                              Icons.pregnant_woman,
                              'Gynecology',
                              'Gynecology Details'), // ไอคอนชั่วคราว
                          _buildSpecialtyCard(context, Icons.mood, 'Odontology',
                              'Odontology Details'), // ไอคอนฟัน อาจใช้ Icons.tooth จาก package อื่น
                          _buildSpecialtyCard(context, Icons.biotech,
                              'Oncology', 'Oncology Details'), // ไอคอนชั่วคราว
                        ],
                      ),
                    ),
                    const SizedBox(height: 24), // ระยะห่างก่อน Bottom Nav Bar
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // --- Bottom Navigation Bar ---
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home), // ไอคอนเมื่อถูกเลือก
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Theme.of(context).primaryColor, // สีไอคอนและป้ายกำกับที่เลือก
        unselectedItemColor: Colors.grey, // สีไอคอนและป้ายกำกับที่ไม่เลือก
        showUnselectedLabels: true, // แสดงป้ายกำกับของอันที่ไม่เลือกด้วย
        type: BottomNavigationBarType.fixed, // ให้แสดงผลแบบคงที่ ไม่เลื่อน
        onTap: _onItemTapped,
      ),
    );
  }

  // Helper function for AppBar Icons
  Widget _buildAppBarIcon(
      BuildContext context, IconData icon, String pageName) {
    return IconButton(
      icon: Icon(icon, color: Colors.black54), // สีไอคอน AppBar
      iconSize: 24, // ขนาดไอคอน AppBar
      tooltip: pageName,
      onPressed: () => _navigateToPlaceholder(context, pageName),
    );
  }

  // Helper function for Navigation (แสดงหน้า Placeholder)
  void _navigateToPlaceholder(BuildContext context, String pageTitle) {
    print('Navigating to: $pageTitle'); // สำหรับ Debug
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PlaceholderScreen(title: pageTitle)),
    );
  }
}

// --- หน้าจอ Placeholder สำหรับการนำทาง ---
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'This is the $title page.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
