import 'package:client/data/model/attendanceModel.dart';
import 'package:client/providers/attendance/attendance_provider.dart';
import 'package:client/providers/student/student_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AttendanceScreen extends ConsumerStatefulWidget {
  final int id; // Assuming id is an integer representing the batch ID

  const AttendanceScreen({super.key, required this.id});

  @override
  ConsumerState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends ConsumerState<AttendanceScreen> {
  List<AttendanceModel> attendanceToAdd = [];

  @override
  Widget build(
    BuildContext context,
  ) {
    final studentList = ref.watch(studentListProvider(widget.id));
    final attendanceNotifier =
        ref.watch(attendanceProvider(widget.id).notifier);

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
          icon: const Icon(CupertinoIcons.xmark),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // Call addMultipleAttendance with the attendance list
              await attendanceNotifier.addMultipleAttendance(attendanceToAdd);
              // Optionally show a success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                  "Attendance submitted successfully! ${attendanceToAdd.length}",
                  style: TextStyle(color: Colors.grey),
                )),
              );
              Navigator.pop(context);
            },
            icon: const Icon(Icons.done_all),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          final student = studentList[index];
          bool isPresent = attendanceToAdd
              .any((attendance) => attendance.studentId == student.studentId);

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            color: Theme.of(context).colorScheme.onSurface,
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              title: Text(
                student.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                "Roll No: ${student.studentId}",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    if (isPresent) {
                      // Remove from the attendance list if absent
                      attendanceToAdd.removeWhere(
                        (attendance) =>
                            attendance.studentId == student.studentId,
                      );
                    } else {
                      // Add to the attendance list if present
                      attendanceToAdd.add(
                        AttendanceModel(
                          studentId: int.parse('${student.studentId}'),
                          attendanceDate: formattedDate,
                          status: 'Present',
                          batchId: int.parse('${student.batchId}'),
                        ),
                      );
                    }
                  });
                },
                child: Checkbox(
                  checkColor: Colors.green,
                  fillColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.surface),
                  // activeColor: Colors.amber,
                  value: isPresent,
                  onChanged: (bool? newValue) {
                    // This onChanged can remain empty, as we're using onTap
                    // Toggle attendance state
                    isPresent = newValue ?? false;
                    if (isPresent) {
                      // Add to the attendance list if present
                      attendanceToAdd.add(AttendanceModel(
                        studentId: int.parse('${student.studentId}'),
                        attendanceDate: formattedDate,
                        status: 'Present',
                        batchId: int.parse('${student.batchId}'),
                      ));
                    } else {
                      // Remove from the attendance list if absent
                      attendanceToAdd.removeWhere((attendance) =>
                          attendance.studentId == student.studentId);
                    }
                    // Force a rebuild to reflect the checkbox change
                    (context as Element).reassemble();
                    print(attendanceToAdd.asMap().toString());
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
