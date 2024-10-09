import 'package:client/presentation/widgets/layouts/attendanceList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('MMMM dd, yyyy').format(now);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        title: Text(
          formattedDate,
          style: TextStyle(
              color: Colors.indigo.shade500, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.xmark)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_all)),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return const Attendancelist();
          }),
    );
  }
}
