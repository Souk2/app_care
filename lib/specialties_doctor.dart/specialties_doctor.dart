import 'package:app_care/specialties_doctor.dart/cardiology.dart';
import 'package:app_care/specialties_doctor.dart/dermatology.dart';
import 'package:app_care/specialties_doctor.dart/generalmedicine.dart';
import 'package:app_care/specialties_doctor.dart/gynecology.dart';
import 'package:app_care/specialties_doctor.dart/odontology.dart';
import 'package:app_care/specialties_doctor.dart/oncology.dart';
import 'package:app_care/specialties_doctor.dart/ophtamology.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialtiesScreen extends StatefulWidget {
  const SpecialtiesScreen({Key? key}) : super(key: key);

  @override
  State<SpecialtiesScreen> createState() => _SpecialtiesScreenState();
}

class _SpecialtiesScreenState extends State<SpecialtiesScreen> {
  int _selectedIndex = 0;
  String _sortOption = 'A-Z';
  bool _filterApplied = false;
  final TextEditingController _searchController = TextEditingController();

  final List<String> specialtyNames = [
    'Cardiology',
    'Dermatology',
    'General Medicine',
    'Gynecology',
    'Odontology',
    'Oncology',
    'Ophtamology',
    'Orthopedics',
  ];

  final List<Widget Function(String)> specialtyScreens = [
    (name) => cardiologyScreen(specialty: name),
    (name) => DermatologyScreen(specialty: name),
    (name) => generalmedicineScreen(specialty: name),
    (name) => gynecologyScreen(specialty: name),
    (name) => odontologyScreen(specialty: name),
    (name) => oncologyScreen(specialty: name),
    (name) => ophtamologyScreen(specialty: name),
    (name) => cardiologyScreen(specialty: name),
  ];

  void selectPage(int index) {
    final String specialtyName = _specialties[index]['title'];

    int screenIndex = specialtyNames.indexOf(specialtyName);
    if (screenIndex == -1) screenIndex = 0;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => specialtyScreens[screenIndex](specialtyName),
      ),
    );
    print('Selected specialty: $specialtyName');
  }

  final List<Map<String, dynamic>> _specialties = [
    {'image': 'assets/SVG/cardiology.svg', 'title': 'Cardiology'},
    {'image': 'assets/SVG/Dermatology.svg', 'title': 'Dermatology'},
    {'image': 'assets/SVG/generalmedicine.svg', 'title': 'General Medicine'},
    {'image': 'assets/SVG/Gynecology.svg', 'title': 'Gynecology'},
    {'image': 'assets/SVG/Odontology.svg', 'title': 'Odontology'},
    {'image': 'assets/SVG/Oncology.svg', 'title': 'Oncology'},
    {'image': 'assets/SVG/Ophtamology.svg', 'title': 'Ophtamology'},
    {'image': 'assets/SVG/Orthopedics.svg', 'title': 'Orthopedics'},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {},
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF33E4DB),
                  Color(0xFF00BBD3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Specialties',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Find Your Doctor',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildSortFilterBar(),
          _buildSpecialtiesGrid(),
        ],
      ),
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 15, 40, 20),
      decoration: const BoxDecoration(
        color: Color(0xFF00BBD3),
      ),
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Color(0xFF00BBD3),
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Color(0xFF00BBD3), fontSize: 14),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
                onChanged: (value) {
                  setState(() {
                    // Handle search functionality here
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSortFilterBar() {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 6), //smaller
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Sort By',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    //A-Z
                    onTap: () {
                      setState(() {
                        _sortOption = 'A-Z';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        gradient: _sortOption == 'A-Z'
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFF33E4DB),
                                  Color(0xFF00BBD3),
                                ],
                              )
                            : null,
                        color: _sortOption == 'A-Z' ? null : Colors.white,
                        border: _sortOption == 'A-Z'
                            ? null
                            : Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'A-Z',
                        style: TextStyle(
                          color: _sortOption == 'A-Z'
                              ? Colors.white
                              : Colors.black54,
                          fontWeight: _sortOption == 'A-Z'
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    //filter
                    onTap: () {
                      setState(() {
                        _filterApplied = !_filterApplied;
                      });
                    },
                    child: Container(
                      height: 26,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: _filterApplied
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFF33E4DB),
                                  Color(0xFF00BBD3),
                                ],
                              )
                            : null,
                        color: _filterApplied ? null : Colors.white,
                        border: _filterApplied
                            ? null
                            : Border.all(color: Color(0xFF00BBD3)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Filter',
                        style: TextStyle(
                          color:
                              _filterApplied ? Colors.white : Color(0xFF00BBD3),
                          fontWeight: _filterApplied
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                'Doctors',
                style: TextStyle(
                  color: Color(0xFF00BBD3),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
          thickness: 0.5,
          indent: 20,
          endIndent: 20,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildSpecialtiesGrid() {
    return Expanded(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 50), //split away from border
        child: LayoutBuilder(builder: (context, constraints) {
          // Calculate crossAxisCount based on screen width
          int crossAxisCount = 2;
          if (constraints.maxWidth >= 600) {
            // Tablet
            crossAxisCount = 3;
          }
          if (constraints.maxWidth >= 900) {
            // Large tablet or desktop
            crossAxisCount = 4;
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1.0,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: _specialties.length,
            itemBuilder: (context, index) {
              return SpecialtyCard(
                imagePath: _specialties[index]['image'],
                title: _specialties[index]['title'],
                onTap: () {
                  selectPage(index);
                },
              );
            },
          );
        }),
      ),
    );
  }

  // Widget _buildBottomNavigationBar() {
  //   return Container(
  //     height: 65,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.3),
  //           spreadRadius: 1,
  //           blurRadius: 7,
  //           offset: const Offset(0, -3),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         _buildNavItem(0, Icons.home_outlined),
  //         _buildNavItem(1, Icons.chat_bubble_outline),
  //         _buildNavItem(2, Icons.person_outline),
  //         _buildNavItem(3, Icons.calendar_today_outlined),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildNavItem(int index, IconData icon) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF00BBD3) : Colors.grey,
            size: 26,
          ),
          const SizedBox(height: 5),
          if (isSelected)
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0xFF00BBD3),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

class SpecialtyCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const SpecialtyCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF33E4DB),
              Color(0xFF00BBD3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(35), //make round of grid card
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00BBD3).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: AspectRatio(
                    //change size svg
                    aspectRatio: 1.1, //change width height
                    child: SvgPicture.asset(
                      imagePath,
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
