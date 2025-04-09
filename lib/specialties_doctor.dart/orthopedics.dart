import 'package:app_care/Pages/Screens/homeScreen.dart';
import 'package:app_care/specialties_doctor.dart/reuse_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class orthopedicsScreen extends StatefulWidget {
  final String specialty;

  const orthopedicsScreen({
    Key? key,
    required this.specialty,
  }) : super(key: key);

  @override
  State<orthopedicsScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<orthopedicsScreen> {
  String _sortOption = 'A-Z';
  bool _filterApplied = false;
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  // Sample data for doctors
  final List<Map<String, dynamic>> _doctors = [
    {
      'name': 'Dr. Christopher Evans',
      'specialty': 'Spine Surgeon',
      'image': 'assets/images/doctor1.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Dr. Jessica Kim',
      'specialty': 'Sports Medicine Specialist',
      'image': 'assets/images/doctor2.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Dr. Megan Chen',
      'specialty': 'Dr. Sarah Chang',
      'image': 'assets/images/doctor3.jpg',
      'isFavorite': false,
    },
    {
      'name': 'Dr. Sarah Chang',
      'specialty': 'Dr. Sarah Chang',
      'image': 'assets/images/doctor4.jpg',
      'isFavorite': false,
    },
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
            onPressed: () {
              Navigator.of(context).pop();
              MaterialPageRoute route = MaterialPageRoute(
                builder: (_) => homeScreen(),
              );
              Navigator.of(context).push(route);
            },
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
                    children: [
                      Text(
                        widget.specialty,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
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
          _buildDoctorsList(),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
                            : Border.all(color: const Color(0xFF00BBD3)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Filter',
                        style: TextStyle(
                          color: _filterApplied
                              ? Colors.white
                              : const Color(0xFF00BBD3),
                          fontWeight: _filterApplied
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Handle "See all" action
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    color: Color(0xFF00BBD3),
                    fontWeight: FontWeight.bold,
                  ),
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

  Widget _buildDoctorsList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: _doctors.length,
          itemBuilder: (context, index) {
            final doctor = _doctors[index];
            return _buildDoctorCard(doctor);
          },
        ),
      ),
    );
  }

  Widget _buildDoctorCard(Map<String, dynamic> doctor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(doctor['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor['name'],
                  style: const TextStyle(
                    color: Color(0xFF00BBD3),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  doctor['specialty'],
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoButton(
                      label: 'Info',
                      onTap: () {
                        print('Info pressed');
                      },
                    ),
                    Row(
                      children: [
                        IconButtonWidget(
                          svgPath: 'assets/SVG/calendar.svg',
                          onTap: () {
                            showCalendarDialog(context, doctor['name']);
                          },
                        ),
                        const SizedBox(width: 10),
                        IconButtonWidget(
                          svgPath: 'assets/SVG/help.svg',
                          onTap: () {
                            print('Help pressed for ${doctor['name']}');
                          },
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              doctor['isFavorite'] = !doctor['isFavorite'];
                            });
                            print('Favorite toggled for ${doctor['name']}');
                          },
                          child: Icon(
                            doctor['isFavorite']
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 24,
                            color: doctor['isFavorite']
                                ? const Color(0xFF00BBD3)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, Icons.home_outlined),
          _buildNavItem(1, Icons.chat_bubble_outline),
          _buildNavItem(2, Icons.person_outline),
          _buildNavItem(3, Icons.calendar_today_outlined),
        ],
      ),
    );
  }

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
