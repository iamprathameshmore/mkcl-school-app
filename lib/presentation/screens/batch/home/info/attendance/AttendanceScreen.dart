import 'package:client/providers/student/student_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AttendanceScreen extends ConsumerWidget {
  final int id; // Assuming id is an integer representing the batch ID

  const AttendanceScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load the students when the widget builds
    // ref.read(studentListProvider(id).notifier).getStudents();

    final studentList = ref.watch(studentListProvider(id));

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
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          final student = studentList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Text(
                  student.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text("Roll No: ${student.studentId}"),
                trailing: Checkbox(
                  value: false, // Here you can track attendance state
                  onChanged: (bool? newValue) {
                    // Handle checkbox change here
                  },
                )),
          );
        },
      ),
    );
  }
}
