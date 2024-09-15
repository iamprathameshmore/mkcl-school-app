import 'package:flutter/material.dart';

class Attendancelist extends StatefulWidget {
  const Attendancelist({super.key});

  @override
  State<Attendancelist> createState() => _AttendancelistState();
}

class _AttendancelistState extends State<Attendancelist> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false; // State for the checkbox value
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Name of Students',
                style: TextStyle(color: Colors.white),
              ),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false; // Update the state
                  });
                  print(value);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
