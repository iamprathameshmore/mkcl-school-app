import 'package:client/providers/student/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddStudentDialog extends ConsumerWidget {
  final int id; // `id` represents the batchId

  const AddStudentDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController rollNoController = TextEditingController();

    // Use the studentListProvider to watch the current list of students
    ref.watch(studentListProvider(id));

    return AlertDialog(
      title: const Text("Add Student"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: rollNoController,
            decoration: const InputDecoration(
              labelText: "Roll No",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            String name = nameController.text;
            String rollNoText = rollNoController.text;

            if (name.isEmpty || rollNoText.isEmpty) {
              // Show an error message if either field is empty
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Name and Roll No cannot be empty")),
              );
              return; // Exit the function early
            }

            // Parse rollNo and validate
            int? rollNo = int.tryParse(rollNoText);
            if (rollNo == null) {
              // Show an error message if rollNo is not a valid integer
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Please enter a valid roll number")),
              );
              return; // Exit the function early
            }

            // If validation passes, add the student and close the dialog
            ref
                .read(studentListProvider(id).notifier)
                .addStudent(name, id, rollNo);
            nameController.clear(); // Clear the text field
            rollNoController.clear(); // Clear the text field
            Navigator.pop(context); // Close the dialog after adding the student
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}
