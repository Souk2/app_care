import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void showCalendarDialog(BuildContext context, String doctorName) {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Make Appointment with $doctorName',
          style: const TextStyle(
            color: Color(0xFF00BBD3),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                //choose date
                leading: const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF00BBD3),
                ),
                title: const Text('Select Date'),
                subtitle: Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                ),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 90)),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Color(0xFF00BBD3),
                            ),
                          ),
                          child: child!,
                        );
                      });
                  if (picked != null) {
                    selectedDate = picked;
                  }
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.access_time,
                  color: Color(0xFF00BBD3),
                ),
                title: const Text('Select Time'),
                subtitle: Text(
                  "${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}",
                ),
                onTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Color(0xFF00BBD3),
                            ),
                          ),
                          child: child!,
                        );
                      });
                  if (picked != null) {
                    selectedTime = picked;
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF33E4DB),
                  Color(0xFF00BBD3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Appointment scheduled with $doctorName'),
                    backgroundColor: const Color(0xFF00BBD3),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
              child: const Text(
                'Confirm',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

// reuse Widgets can be StatelessWidget
class InfoButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const InfoButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF00BBD3),
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF00BBD3),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  final String svgPath;
  final VoidCallback onTap;

  const IconButtonWidget({
    Key? key,
    required this.svgPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: SvgPicture.asset(
          svgPath,
          color: const Color(0xFF00BBD3),
          placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(4),
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00BBD3)),
            ),
          ),
        ),
      ),
    );
  }
}
